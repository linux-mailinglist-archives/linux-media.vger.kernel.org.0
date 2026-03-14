Return-Path: <linux-media+bounces-55801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHXCMRTtWlGzQAAu9opvQ
	(envelope-from <linux-media+bounces-55801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCFB28D1FB
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6F573014C5F
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 12:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FDE30FC29;
	Sat, 14 Mar 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="K+11Cc0J"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020110.outbound.protection.outlook.com [52.101.227.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9623815D;
	Sat, 14 Mar 2026 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773491137; cv=fail; b=Iamm3Yyo1Slwi7pQkPj+BT0U+zvSjyBSHCoEwG1TSwQY7ySBiH2URnYcMR3BdD/nJmTp0r2h0ImIdGlTIIMj7O4KZ6KatFvQ5hUknWpiPcGlh7afZR+6y0MBE2G0pVxZ/ijhQ56Q7AJbDKApmJSLrh+/ymGEwH1LO3r1qCuOzeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773491137; c=relaxed/simple;
	bh=Y3Hmv56jiuKeSWMiNlBL32JXKJAacOEuaG4al9+5dO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BsrqkjkGNAwmucgQc3JrGQZVstHTFn5qEqn6ebQE32ZyztOeisuODH5JFMKhOLuJB1lfEpALdIdRmi70pLruo73UBDk44PD0TiRyhMmqs9+jG27N6ZI4TwwLtYFnTAqT9knl9LO9TFk2wyccENqwbgs2lU9Zs29N2Wyv8mSFjHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=K+11Cc0J; arc=fail smtp.client-ip=52.101.227.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsldMPtLC+KDgaQ3Yp7uky/1/+zdch9202f1teMBx94Av8HygoEfTgi2/b9/JbDIIL8PELLRZPccYF9YU7Vtx3hTL3HJuxR4bcEBSrdcxaMEknLWmWCeYyopZP8EABCfNQ7Yb0gewibTljQd7N3F6njtSDm/jprfobDECLkFv3W+EAU/WJPrDONP2FemkOfTLqwVmpswEpWYf0qE0AteHRcvxX1kGPV8fbbvIABQgIg1jqVgF+XhUBMOSAIfd4FtKgoqjpEzVUzl/3xC6uoPQt6rcMAY4VLagItZM9vp9lCw/bDkKEkgIKPEUD440ivk8JVfpzDXWBDppyQRsVeoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFZ6SU7i1WF+TrIUwJvR2LWMVmWtw7kD2ibC4Ior89A=;
 b=CbNQS9GtbObxJDYojV0B4FoDqqbUw5Yhp3APFaQ1E0d2gwLKj75bwnINAZ8Qx8I8XBo5q+eIAc9gMMDHBiwoAQRLoEbRL8R51iPpZfnwHPuM2zKWAMurWKmF38TYNb3if8FYjaL+58DwHAG9H5LYd9o755ldfW6jt5KJAmT67xNqA4ruBn+bVVTdeGf9frBvDBDIwghBChrO97ffhWWA6ABcnZQ/vxzON9jalzxzvXRFLuY/BoqzWdMOsffRgVsmIBIUgCQtaynxvgfMjYX5PLb6mGSGDHfHuE47b2D7YWPnO5csWArmj6i4KW9dAK3yx+Ir9YO8M8HsBqeTEJHLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFZ6SU7i1WF+TrIUwJvR2LWMVmWtw7kD2ibC4Ior89A=;
 b=K+11Cc0JVZ/lgzZiaQJBTglBqUVPWiSL3lg9pkC17lRhoWRdiiHGzqlv0e3TBA1ET6xs+MwdeH5ijq6UAD4QdJGKKrNsJtQwSRzwmZzI8IfxJ9aIUQXXM3JdnkLD7B2CJpJ24SdgC/sDRN2pQIfAizOK4+wlTeHKfGvP1g6mbqn4N4W+iJwcH41lRYrumw7JWyhDy6LGPV17O8uKzdKGwxnipyt0EQPkccCtqpvj5v1AwQMml14sl4Z/IIwUoXEOFBPzHHF0Nb50uENguwPNQe2JVWMv/OfE4MWYlWkqcKjNAkzw2BrVoCFRZ8fSYeR4zwJfc5hAxzvbeLxKc42W9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by MA0P287MB0466.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:25:33 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 12:25:33 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: imx412: switch to {enable,disable}_streams
Date: Sat, 14 Mar 2026 17:54:39 +0530
Message-Id: <20260314122442.109356-4-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
References: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1d3::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB2188:EE_|MA0P287MB0466:EE_
X-MS-Office365-Filtering-Correlation-Id: 099fe0d6-b626-433f-be6e-08de81c4c98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GxdBFdCb9ElKSNxsNlYqf5SKo2Y1F4i4Ynlg40RmDSUfSc8nMc2/bUSfCTqQyk3utysgb6nidhLtoJbJEjKIOJ2vAOEGOBF/4CTiazW0dJNd/Lscn1EgQDoOPaLCfayN2CP2B8L+/LdqU5WVsCxuOizd5nXsnbxL+ZP7Vn0P3INGC6nJD5vYLVpYQD4iuyMLb3R5IMACloM7HnzxCNw7sjKVQfyxKu7o3B6uc3/qrTE8ELeKwA5ULLD++uEGuqgyQUIdFTdS+ai5NJu5+f2Y+xzniI2mkE8gpBavWbaTRQvAqvl3faevNpyh/vbmCCD5uEUZoL8Nsv1TXbdQHQjdVXiG3HFe/RgqV8Oor2dhB7yvBwxLDcV+SgQzqb7qCNokG0b/vbuhl+pt3LEyTCNNA33qoQux74VfSU1fX30laycelgz4piSkD/ifxJWMPeNvXYOzOqN7enRpvJHAIQ2hMOIiQjTNKdVN7fDW49jq3xr12LFucbuFeMTZhmlH6EF/2of2lfqGH3pqOVu+x/Hx3vA3WSuZYSZYBJ+bABA08V2F1Ic1HAQEDg+u97d0G9LDx/3+otCl31uhU7ezfTaYmqICN3Qqeg493t1rYKc2Ff3TKpxNcE1vUa+FMDygWkY8jyjU9OHvZkdNK2GyQnpQdEeordvQ1IjsaLe1bBcmGxkMGMkjXBWSi3lFG/F2sItu7fWKuUb8+JYLAUPnseaJ1fX71EvbSsbwth19OxkDrN+qMWyQgoYqzTnmC3j/NdYMrpCc0RVONC3p5BIc5Mxf5l+//MhBlHRUkyPAucvR/tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XplJYtugYD+jfpAcaY89TEu+H4THrrbul2fWBeuS5ZZnz1ZspBZnlyeD5O6j?=
 =?us-ascii?Q?mzQ8MzxraciRYSdu6ya/+CUMJAJYBqeuEf2lGUeQkuG52IlFSnwgI6aKBAXI?=
 =?us-ascii?Q?+vdMN9Yr4C4E1P8ZBXcjO+0jbn2DUaWMoCU2l7h9XvTlX2a+ODjUREIUgn8A?=
 =?us-ascii?Q?s6rRlAWpOUNMJCcE2e8+qRclpVEdZP9UyO/KfjavfmauRd2gBAx+J/Mi3zUu?=
 =?us-ascii?Q?u9Qvtvi1V6HTsugdwITQQ1gN/8CSeT5emn3f9xSnbDwNL6k6fUBvNFxTooOt?=
 =?us-ascii?Q?ABz7d+u6kxXxl2dDydXlvpNvSt6LSVzKrcGAqYAShCTd1ViIhm5e+H8YjH3S?=
 =?us-ascii?Q?WvKIVKSa6Lb6FPozeueT75/YuFo1oxp1K/2b2KLf9Q+lZPjEG7jx4r/fkdwV?=
 =?us-ascii?Q?TroGU8SY/qTPtD9sOr9Y/BJM+fN9GKJcUBu87y5XhVf4/kskfQEhntf1CzaC?=
 =?us-ascii?Q?b5UFgi/avy+AdnTW20Q5its1+Dowu/Fjd0EPWSLfh7xou8aysU27fAis/kBj?=
 =?us-ascii?Q?MIKE1BhubSIyOb6008MfmEEP7jFndFHQ5gUiFed6K11Kuk2MwsrIxVrbCSlQ?=
 =?us-ascii?Q?C69a9ZKgWAyhjvUzfwsghVfjsfmIcKqxhc4UuXuiC9SqR4Bl2a7ZvejXjjCp?=
 =?us-ascii?Q?votZETjgOMoOzez8kXTbZgLwIoANo6D0dZ3zOfWH4OnD6Ao0nQ14pA1BBhCr?=
 =?us-ascii?Q?feUqtfqAHTY+EYKW42CrSFa/6BBVAAToJXvt360iQdt1apwU78qpdeF7fVoP?=
 =?us-ascii?Q?NlzUf5gtg69uavFRUKSSFIBS2n8CABlLupJmA9fSkt7m9mVuTIdhyhkRJHgX?=
 =?us-ascii?Q?+3y8FpFQZ/+zHXztjCcruo6YE4NMqBij0+HnzrRikNgjDMTz+qfcoinOfQ1d?=
 =?us-ascii?Q?NrqEzIQbaIUYy5e4Ku/vA+MBBj0uAsLk5quh/CUsTBxyphp6tVtsrFF/rMg2?=
 =?us-ascii?Q?1KO/AS4gSODTsbhyNNqMmCG4fQth+r/nGNuj5qsKXtKzK97JMQ5McR3Cj91p?=
 =?us-ascii?Q?iinvNF2WUcP4fc4wOPoMzB+GiYtZOrB2qaktZBs0W1HA8Mbo910o01e3OBG/?=
 =?us-ascii?Q?RMGHsFwK0FlFiONImAChRmkjVG6QPBamY2fBRqHf8p/YZAwGqNFDuoZwcVqU?=
 =?us-ascii?Q?u4ywoBlqige+UasVHt/jZdgywvnPdi5jPBL1gNMz/+We3cTbHX15Ismtmxuh?=
 =?us-ascii?Q?kHY5akTOgLCD2/9GmiP9u7G7qSNe68q6bZRflO7ED4g4tCU/nMnjt1Td0CTQ?=
 =?us-ascii?Q?20NGtSVeoovACDfSW2BdDHVlmruqiVKhMqKi47nlA76mT22FdPA+S/xMC2U6?=
 =?us-ascii?Q?7GZqm9PA2erVSPNC1ERPs4o3sm6iKd02aUOdfyy5VfTGxlFnD7aomJtuvmao?=
 =?us-ascii?Q?NBIO9W/s03B6w7BrzX/yRdDqHOZbEB0QLmMe8P4Jk2GsW2KWb1v/fRYJFZD5?=
 =?us-ascii?Q?OCqiEjvZtNojypFNlkxfZYYCkWxtSyw2K9o4Rc7GNKFb7KogIBspHeRjHHid?=
 =?us-ascii?Q?ZTbZF+d3/lhOqpdpxJZ4b5hWDqFQYtATs/u7JSwISLPtqGokkvAjGdHaKhQg?=
 =?us-ascii?Q?2GmznHwEHuYLkgr87g7CW6Iwp5duYZ98+AsrQZlcMCB5GS+6aRO21L1PNzUT?=
 =?us-ascii?Q?qWab8qTWGExYhDV/jbd3JxL8sgLEWm12UPI5GzYZ7nKpf34HJPt7CuSTnP7y?=
 =?us-ascii?Q?flTxwmBnqGA29hNzgsuJ1w4sc2vTvhPz5WqvDd43Aux79d+L2rpChUY0uVvZ?=
 =?us-ascii?Q?fcbjXxuibpZVIOyi8m7QiO5ktUrHy5k=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 099fe0d6-b626-433f-be6e-08de81c4c98f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:25:32.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF4cX2x81B2YRaCu5cR2UT4uZru6FFX5ymInu02Wi4Z16DkwvcHC9Kjg6zFfdfyD6MShA90Z8/jPRHFr1/WzA1u2Xfs4FdqRmNhI66vJrr2+HxFTJOcXKiNB7N448oFI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0466
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55801-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBCFB28D1FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/imx412.c | 80 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index ec56ccc22423..c59f375f0330 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -676,30 +676,40 @@ static int imx412_init_state(struct v4l2_subdev *sd,
 }

 /**
- * imx412_start_streaming() - Start sensor stream
- * @imx412: pointer to imx412 device
+ * imx412_enable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are enabled
+ * @streams_mask: bitmask specifying the streams to enable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_start_streaming(struct imx412 *imx412)
+static int imx412_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
 {
 	const struct imx412_reg_list *reg_list;
+	struct imx412 *imx412 = to_imx412(sd);
 	int ret;

+	ret = pm_runtime_resume_and_get(imx412->dev);
+	if (ret < 0)
+		return ret;
+
 	/* Write sensor mode registers */
 	reg_list = &imx412->cur_mode->reg_list;
 	ret = cci_multi_reg_write(imx412->cci, reg_list->regs,
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to write initial registers\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx412->dev, "fail to setup handler\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	/* Delay is required before streaming*/
@@ -710,62 +720,42 @@ static int imx412_start_streaming(struct imx412 *imx412)
 			IMX412_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to start streaming\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	return 0;
-}

-/**
- * imx412_stop_streaming() - Stop sensor stream
- * @imx412: pointer to imx412 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_stop_streaming(struct imx412 *imx412)
-{
-	return cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
-			 IMX412_MODE_STANDBY, NULL);
+err_rpm_put:
+	pm_runtime_put(imx412->dev);
+
+	return ret;
 }

 /**
- * imx412_set_stream() - Enable sensor streaming
- * @sd: pointer to imx412 subdevice
- * @enable: set to enable sensor streaming
+ * imx412_disable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are disabled
+ * @streams_mask: bitmask specifying the streams to disable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
+static int imx412_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
 {
 	struct imx412 *imx412 = to_imx412(sd);
-	struct v4l2_subdev_state *state;
 	int ret;

-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(imx412->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = imx412_start_streaming(imx412);
-		if (ret)
-			goto error_power_off;
-	} else {
-		imx412_stop_streaming(imx412);
-		pm_runtime_put(imx412->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
+	ret = cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			IMX412_MODE_STANDBY, NULL);

-	return 0;
+	if (ret)
+		dev_err(imx412->dev, "failed to set stream off\n");

-error_power_off:
 	pm_runtime_put(imx412->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);

-	return ret;
+	return 0;
 }

 /**
@@ -882,7 +872,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)

 /* V4l2 subdevice ops */
 static const struct v4l2_subdev_video_ops imx412_video_ops = {
-	.s_stream = imx412_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };

 static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
@@ -890,6 +880,8 @@ static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
 	.enum_frame_size = imx412_enum_frame_size,
 	.get_fmt = imx412_get_pad_format,
 	.set_fmt = imx412_set_pad_format,
+	.enable_streams = imx412_enable_streams,
+	.disable_streams = imx412_disable_streams,
 };

 static const struct v4l2_subdev_ops imx412_subdev_ops = {
--
2.34.1


