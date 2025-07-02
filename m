Return-Path: <linux-media+bounces-36531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FCAF12F9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B631BC1A40
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5A82673A9;
	Wed,  2 Jul 2025 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a/pNP12F"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B9266594;
	Wed,  2 Jul 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454007; cv=fail; b=uid86I/FVPOcfDoaUrc83V9NDVPO/v5+Ss2ugQtmdIQHjmXGeyHtowxxhjFcxjDTVQQP9/2EYqTKy3GWq5EKOvBaiVFZiRBtqjHsX/9o5KBQu2eII97Pu/rniyI7sarqVVo06qXDnEU0x95Wx98FsKFZKlmf8G25WacLu4rOzrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454007; c=relaxed/simple;
	bh=JCZY0iRmVDFhPBQ4p7DBj+2+yVIr0nh6g3t2K7SV4cA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mpIhTb/bSRlzVt2ZaSqTvzuDmXvStUVYTS7bxp3cGmplZVjkUnwBZ4ZJ936HWkohGf/LygeoCd65vM9wKMTsRmwCWJk6aumWbY+4a6LBsxJdBSp37+dvO1RTWdW0745m7tbBnhTyCm9Xlq6r38HjVAXH+2cO5YlY+UOyKjv9kY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a/pNP12F; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjhG1JY/46QfcO1yu1moNAoRrSfJT1Kt/20k9RdabLB04m12OAN/QxtAewzGALz1WG/N8CqD8UMFsfkmLGAMneZezZvpsTAqUsKTmWeuT1yRre/NqKj9K984wcijrsdwJat6IkPXji7ppLCgtaV8qs6OKIBGyj9irUJ4U3QSE9l+aFyl3PQrEOctZX/3wxpS2XZpi2MOUXrDeIFJ+eMxHq+x337s6KwfUYLdzt6ux7jMoVSg4uVNz0NQ4/Nj/6P/jt1CgYOxrg33imm02baAZM9ql1DQnZSnGFH5cWJFkMg7YtlGoK5ffR4c0jtcy1Ca3o0HHSo3lqOYMUe5bUCHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Tsx4NTrUAsBPdWqxKPaq3CPcY0mQlHMHtvxvRjtqxA=;
 b=oKPC3G49loARcAl+zFeBDVtEQtZGEhg/Na8Z9Q2tyEiDcrvw9qQSndKjDcjx7yJ69GyXviXkiSFRNyPXm5HrogsQGdKOUeNYnydY7QiEWvriT4wNcQRI7ykq7Bg/rlQHGvbzuzC6hSZyxY5bihR/J2cVsM/aRmNYIUrIFPfc0aMBg7xdSqmj3SEorlMXWDB500YH677sZexl9AJi1k/b+ZmNxQ1M6vUGmWoQiNN8SCUhlnNubxrDnOGvlhN0zg/u1TTQ9NMk3zrfOFjRZBmKzQ6rxMZxkhOcYweSN9Abjwg8fDfPmTPBofMk/iBzc2a58jJkOjVpgDzv8XYQo5yjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Tsx4NTrUAsBPdWqxKPaq3CPcY0mQlHMHtvxvRjtqxA=;
 b=a/pNP12FlxhI2pl3SXIduyIUADeKIlGA1B9DQsj6jgwiKWDnJq3M/W/ghkJySo4tIVm+MNDfLd+VTqPEMwoma955hxARkVSLyAas46HsCKE73GydlitLBY+p4yACRIYIrkg8e+5aqDQYVNoAkI43wlckpLBLCNpSmvxKArwhydYy93um+jbqKA471ZQ5m0bwAU4a/cQpARzAjoSHWnYq9tvLU61zpGW6LDqjPv/KpWNYlzbRW/pt5EgXtVlpvH7Q3L2gDEyfYLsSekyoda59J8+DUZZUr8yra0kKNDrBAC4bSquj4IqD/w7roq6lM/tb6I43axJfA6cu+N6jwhh6YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:00:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:00:02 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Wed,  2 Jul 2025 19:02:21 +0800
Message-Id: <20250702110222.3926355-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702110222.3926355-1-xu.yang_2@nxp.com>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b51bbda-8fc0-496e-75b1-08ddb9579828
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oXoTnkvOJFSMuHhX2mPlvWRLWp332aNPaNjcxb9zeSBNo2GeAki+wP8GfFtF?=
 =?us-ascii?Q?FERu3iDWb9tko597jMwpjW9a7pwu3uw1/MUgMcT3kdYgAdk3oONIEexQHkOH?=
 =?us-ascii?Q?F1xhAay46KSfbAAjKz2f9o+Y+1UX0ix5y+y9jKMyIASrqya/gQbuUlFdTCXl?=
 =?us-ascii?Q?mCcZn9u6zi751pPV7qNxBXdVKq0DEw7K3QIoxgzfZ6VIcjIz61r05aZkSVCx?=
 =?us-ascii?Q?0aGIWUL9M3eq59kd9TPpkS9ZNowZBH9iA2rtPK2xiKeeYjPwK70Vfjng6MWx?=
 =?us-ascii?Q?wjWj7nzHog21XqDuifkokIsjoldd0otF/mfrEDrbgNtC68NTKNkXbd25lRVA?=
 =?us-ascii?Q?mj4pae3A5Yd/Ogqb3dej4z0JxpTOkr/QwihbTPigLeR9WyVfWaQrlYu/QUYE?=
 =?us-ascii?Q?XugLPTuxbSXfwZEJhP07Z59TPbgLM77INC7X9v+bdTt3uoNpmurRNs3QyKVY?=
 =?us-ascii?Q?hE6qaTFdGCA3biqMrswl4A47k6rTiT7SMIT8qzGp/AQi8DoX2tpawPIxBP/Z?=
 =?us-ascii?Q?8AqtpP4b2d27BqxnCX4ufM7EyYCc3IuJclKwok0NujFcbEPq7FckCYhrxZ2R?=
 =?us-ascii?Q?pH06Ak2+ByCUco4t1tOLgimSY3Qfz7CidzPe7spB9EtFPUyDjqF396I63xjD?=
 =?us-ascii?Q?1qjiN6knCPhe5alWADV6OfQK0YkD0L1p1SwP0MP5l2MLu1GNXKt4Knhpbq8r?=
 =?us-ascii?Q?w+HuqUudbfiVtQGRI28UEFUhmFDFaLsZzdCHA/EXfJB1DVPTHqYb2J3S48oR?=
 =?us-ascii?Q?PQwiiiXxq4sXPbj15g06B5zYpVkpirOAzUKOcIuAyxIxszEvLxNNL3P6coFF?=
 =?us-ascii?Q?6ZWgJKdafno+qTrWqycAsMVeoGwxxbx0QsNSnlumCknx6pXrxuJpUWDwr2SE?=
 =?us-ascii?Q?Cs1LpVkpIlYtAC16K3q+QxJq6usCoLZKryH0o66nEw/obVsYF+7qbiTpDEDj?=
 =?us-ascii?Q?LE1whhJI/TWHfSgRPK2IyWNXCkv4+GUmbPvvncbOk+tL9sNoWzp0MjqHPi3t?=
 =?us-ascii?Q?2cQRFqtWL5zjQcdlKQL+26Tuyz4i0gSo7bnibnihcqnvK7JBzgAilSTx2Tn+?=
 =?us-ascii?Q?6BiBoX3X++3CjrcA1WBBLdo9Tpu+ewrexsDSnuTqZ5Jb6bTVv93efA563iPD?=
 =?us-ascii?Q?XlJt3vbULYQhnMvf5sYlOWCOoswJhkq6yk4FHjM4ZqvDGQ6R7uNgD4HXF92Y?=
 =?us-ascii?Q?1yw6OTrZ8G3ayJCmsqPHOiIa0oHdsBE8K9W0PUceyzrtVkKfTXJ2w3lbwrHo?=
 =?us-ascii?Q?vFPgtQ504yfZU0ZqTXgmpgeyo3EACvw1lTqPSq6KQjz9NPhyFTVYoYtHDTxM?=
 =?us-ascii?Q?O2nVuuD5YyavahcCF3/zIQspGtk0zPgMLGrHh7khRLvcxMRjnVpsRnXGQReW?=
 =?us-ascii?Q?lAtHMTNXkpUxqcDthhwDM1EzTgbyYEnOmMNP56yeOXvThgcOTpD1LOzO/kbM?=
 =?us-ascii?Q?03BNczsuJIBudS1RPE7IS65zhIZYvlOcYRPWFGMyIHnxeQaA5RmrWR39tU6f?=
 =?us-ascii?Q?wW6jeUZvJHBKIVY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?UChIQkx/93Ptqkif5Z+uimBvWNwc5pb2HaC2Xn+ebNMn2cs2EyfSjdV8Fenr?=
 =?us-ascii?Q?sNSZspRdcRAIfqOlmLmbNLQeW0lIN5r/L8MGj+2yH4lVPFgj3bnaYcDbzAnE?=
 =?us-ascii?Q?tmRCDJuOMLElZpcm8J/bwW2MAh9TImeyTmZ6jeQUvMdZKFh7aiYzgWRMtlXZ?=
 =?us-ascii?Q?/X2dPlKHB4O3mG2/O9GPu73gqBqQq023Qsi/qkqLs9YfiCQBN/Sj8MLkkKzM?=
 =?us-ascii?Q?45mwZyM8M6Q8ChdtQF9xsRDtLAEBZVsvjYL+OSmI7zsrv2jqS938wp9/b6uF?=
 =?us-ascii?Q?GFJ5VvRm6nD9bndqBgnQQ4g540zJB1H8prtUBG/AxpN+qAu1zFMdJcWaHM+a?=
 =?us-ascii?Q?56FmUDoH0oQZ5pUfpWZCaLmqJfv9kM2bXR6UuxIX0XoA6D76tTX2WmJwSwku?=
 =?us-ascii?Q?ZmKOgJPGPbdyNojiptL+cwEbENfvimJp3Ql6q26qfE6i2SRADqCPUrmLiMh1?=
 =?us-ascii?Q?3r4ej223B7w6m1VVwi3JUG5TpDzAw96T/dmKqyHBgEC2JSJCMxLj62nXY9Bz?=
 =?us-ascii?Q?PEqtN3Z/Bj1JkC9zALG/HBfHm1DqG5a9ZVYRYrcNLKqMaFfIFEK77B+I3+Fw?=
 =?us-ascii?Q?EM3MOv7SX9LOWze2pOIJ1KSYUKJAujbkorl5z6yE7Y7czk2PRk5E2Eo7icK3?=
 =?us-ascii?Q?F81kBHEECOlUhmUKezywc8NgOzPYV1t4AUUwr1P+7v2rWb4GTISWj2Qftqba?=
 =?us-ascii?Q?7cSCFf0v1KO28CeD1bftVy8c9ocX/XziMY9OmeTSVHIY6//0bAremEkidi3h?=
 =?us-ascii?Q?xK3w15YbXm+WMkjpd9+JH+TkqsH5tUIbSKCPY5T18S8ewhJwU1+4u2nqA335?=
 =?us-ascii?Q?VCCWrvUX5B467TtQlM+YfpeGIc7gZpA16CRObbnN0SNs823ruOMR4Lpb2Fro?=
 =?us-ascii?Q?40tt5W93gfb3WG4v0jMWLuQ1R8e3wF/IB0KdRn1KlHynseFBZEIn1EqlgNep?=
 =?us-ascii?Q?tocxeWHT7EhTgRyWPw9N1zvjFIcZUcdMcrMuSaxdPjQw3Kpvd3VtfnEBdnwP?=
 =?us-ascii?Q?6utURRgjnwDkklPUnVdn/m+iKDEU1oXeoGjIrP73HhdYTaFGXLCSc/URoGLV?=
 =?us-ascii?Q?dEx8+c35OYpocc/W2Ic7x0WU2CJfiM4ng+xt3EtPLo0LbZiedp02Iw4+j4PF?=
 =?us-ascii?Q?SVFh9IofctEy0iUdgM71Fe9NHrITz7kGXmvuIF1Sb2EBZwtcFN6cKRmdNEKQ?=
 =?us-ascii?Q?hpaJsajAolNKQvF8Lz3x8aKftmJb/x3a76EXLzsv62ECBowQobLAh8Dvrcy1?=
 =?us-ascii?Q?NVMwYG6MYCxnH9oaqBtINuhbKxkmJtgSaq97nNnRC4GhNlJunWGMXsy4tKFN?=
 =?us-ascii?Q?ccBVdIU3n/SX7PYXy5AgGp1Ru7zvbI9Haj038R85bWIw7gpj+DO3SqEFSm7X?=
 =?us-ascii?Q?BhDvl4uB0V7KCVBFKPnUPXRguIsP047MQAUHWrYxxt2YA4ATKYPLqeKSZWh0?=
 =?us-ascii?Q?Llz2rLFvyvPzJb6L8m9fs/PgBppkcK3+IwTE/cdr7flIReK9/8qfHcW6rB8O?=
 =?us-ascii?Q?J190SzKVUupKhpuksoqhvw01WgSpKMA2Ta1Uo4hM6lY1DNfDBEqWzHQ5fVyk?=
 =?us-ascii?Q?V0pOGg8w5kRhGL7n6/49IftYW+GCrqFvXPiHVQlq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b51bbda-8fc0-496e-75b1-08ddb9579828
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:00:02.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6piUxNANs6+8BAG2Z5qdEglcwgD8aKioQazH8x/zvBIxFxuZEKxcGymVDs4S5FL2JQZrhuoElula2GI7W/27MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

This will use USB noncoherent API to alloc/free urb buffers, then
uvc driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
---
 drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
 1 file changed, 14 insertions(+), 42 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..614cf4781221 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
 	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
 }
 
-static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
-{
-	/* Sync DMA. */
-	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
-				    uvc_urb->sgt,
-				    uvc_stream_dir(uvc_urb->stream));
-	return usb_submit_urb(uvc_urb->urb, mem_flags);
-}
-
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
-	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
+	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		dev_err(&uvc_urb->stream->intf->dev,
 			"Failed to resubmit video URB (%d).\n", ret);
@@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 
-	/* Sync DMA and invalidate vmap range. */
-	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
-				 uvc_urb->sgt, uvc_stream_dir(stream));
-	invalidate_kernel_vmap_range(uvc_urb->buffer,
-				     uvc_urb->stream->urb_size);
-
 	/*
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
@@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
-		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
+		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			dev_err(&stream->intf->dev,
 				"Failed to resubmit video URB (%d).\n", ret);
@@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
+	struct usb_device *udev = stream->dev->udev;
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
-		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-
+		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
+				     uvc_stream_dir(stream), uvc_urb->sgt);
 		uvc_urb->buffer = NULL;
 		uvc_urb->sgt = NULL;
 	}
@@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
 				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
-
-	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
-					       uvc_stream_dir(stream),
-					       gfp_flags, 0);
-	if (!uvc_urb->sgt)
-		return false;
-	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
-
-	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
-						 uvc_urb->sgt);
-	if (!uvc_urb->buffer) {
-		dma_free_noncontiguous(dma_dev, stream->urb_size,
-				       uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-		uvc_urb->sgt = NULL;
-		return false;
-	}
+	struct usb_device *udev = stream->dev->udev;
 
-	return true;
+	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
+						gfp_flags, &uvc_urb->dma,
+						uvc_stream_dir(stream),
+						&uvc_urb->sgt);
+	return !!uvc_urb->buffer;
 }
 
 /*
@@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->complete = uvc_video_complete;
 		urb->number_of_packets = npackets;
 		urb->transfer_buffer_length = size;
+		urb->sgt = uvc_urb->sgt;
 
 		for (i = 0; i < npackets; ++i) {
 			urb->iso_frame_desc[i].offset = i * psize;
@@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 				  size, uvc_video_complete, uvc_urb);
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
+		urb->sgt = uvc_urb->sgt;
 
 		uvc_urb->urb = urb;
 	}
@@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
-		ret = uvc_submit_urb(uvc_urb, gfp_flags);
+		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			dev_err(&stream->intf->dev,
 				"Failed to submit URB %u (%d).\n",
-- 
2.34.1


