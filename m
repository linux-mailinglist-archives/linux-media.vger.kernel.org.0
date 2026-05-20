Return-Path: <linux-media+bounces-62248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JrKONyiDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:02:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762358D32C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC1B5309002B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CE93DA5CF;
	Wed, 20 May 2026 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="St3bJdGI"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E3355F42;
	Wed, 20 May 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278229; cv=fail; b=pN7rIeXBQ8ngFTgJF4K5C8sBzR6IcgRFqihsDG4D6YlGUeWQPVKg/2dg6DcbZsHfvlJLIvOhbo9pCZXn/X/gBkt9QTTzabvsoRnM/E5sQHyVPkwz5XY6NM7gXc/yYS3q8fMbNbdd+0W7DTb5rrGfisr1mDmTcYB9DY/ACp3V+k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278229; c=relaxed/simple;
	bh=ZAKka/ySWt2XaTKiJW2njV1wYx3DEVDmMZggLjGqmAM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eNgKAUleFDlMxoUc7fWFmRYDtpmFpp3JwToOZO04joGhtV6LTzuCZX95vLbCx7OumOf5x5p/KALzqGR6pYGB8LZQkapntqWTTPqVfOBRagsO8HCetW18lrM79hN6ILcptaCOpDPuleXibBa6ldDK9e7emNPPZPyO7OtWZBLpwJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=St3bJdGI; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ+9JpkufGqpPDVefGoaJzU021+LszZbG+HmM6cxEAZNUXdZwg0hPH7+PVmqtly9mR0MM5qyONbkRY+LZl/8oac5/Gk+txlxfdgNfMW0fmDq8p1wopFplaQt/JEHy/Lc5Q0D0t7byW4VWTd7ieBcCabby6PGL35Y/ndDWafl7/p/2W8ZQEtoyWGD+Bg7bs2JCPcnINlSxnyEhJeTbHkgBTYFu2h/X1HU4CwYz/1CqqwEXOju1hcNWqR5aXXA4W7AQaUgmNXXak/uyAIrKXeJYk0WVdR7dKYlLpRoZWHRdIfqzT5NhLb+UpYb2idwRJe8cwQ8h4LUy2nr8zV9AINrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TfBo7cDOf480O0C3/qfy82Yru3WfqbqPfXAQvQ6Jjg=;
 b=useBSNGg0JOLg6u8zf1nGJFWi99d01tBD/WSEdBaEgRgcp+SEVu2spP5MOIGs40bQSRZOH+mVIteY0PGh0ZH77CUx4wmCyjJaOebB+Qqp1p1a9m9Xyq+Ji2D8ckAC1yDiRWztMKz8J7Sij7QpqQrpSHX+0/3eMecS6XejnkWZ9+kGBHejNF918u2U0T9E31TpQLYqm+3QyLMg7Jdk7X4UZhC7seGU3RIGlQHdfaytZcJAgS6/f0IDSRAm0WgbPb+BfZlitS5KUv+jqQ84VzVTL2riZtdZ9ZVtcT5E/Kc0GCeNL+EocwYY2QAVKwxTF/bcg44u43U52nYOK9NFmdyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TfBo7cDOf480O0C3/qfy82Yru3WfqbqPfXAQvQ6Jjg=;
 b=St3bJdGIObRksZKnSOf+u/zJJco62K1Anpjvzq4DEP+jKJwbXsSF2aixMg1mk90LdYICeWEvpimbyfrRGuXh43zpcSUCKAM49brXyl+7ijr27IFny8tjgrRcP8txsO7yJzY8IsbAuFs4amwDgmT9+sC8+N32q3xU+kb+VP1NL//FTvoFKT8Jp9/li+5/5MFksU9OcmmnmkefmMuRP2FYsPmsUt4VoIyrhNapm6kkrHmHwYp3qBD0sj55g7RlIh+7iO42jNoUMobgjss4mzOya5gnDaqADzpc5DpvoFFBkB8FG2BL+VrNyIljxFU2ejp7y2rrLMdsT7lCDcO1qPTiLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5499.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:57:03 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:57:02 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <HimanshuBhavanihimanshu.bhavani@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: Add imx576 camera sensor driver
Date: Wed, 20 May 2026 17:26:32 +0530
Message-Id: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAUP287MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d3f4f2-2fc7-4be0-1102-08deb666e7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|5023799004|3023799007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XuU00zoaNGKZ3pxjBgl1YXJ4aYhjYRDQxB//PSw3aX/dQgn8r+Pq8FVosN1Uf3u3xQVXA5iXmAfEV8QdRIVQFztfsW4fcxjw+2A0m1Xh4R9bb+YPFco9i940lFK6+vTblp1KURRGRYU+3Xdx6UeKrBjWR2Wy3OR9DfpCyVua93eRQVVrWr5hrWcC2Py38+AgT94spCOmuzpRUlQCN75JGDudp6cwOAzAX+PB1Tlpm75ShZvYCg+O7VPxx87+Pa9FjfuA4kaPM/Ji4V0M+4qPShYAz9iwybmiXWgR7BjwhLxzxInbII+raYy2Pvb8Ebj8CxXnnrHRYnptPQEychoI/syOGGwTvQaTv/T3w/ym4lvdRZrFMH5dU77fGgKefwZYkK7f9fGyKAdyEy9yK+Rdq49u9y4iYvSnlBa+T/Hn6UGTYReAI1mG6YlQ+mP+Aldn8Vj5b+1WU+fcySutwZL4oDG58/TwmT9kKpxOUERvZaseOzXwP6gShYHp5VO5raZpsMC7cbiSqfG9r6joiU3uHoeA88zd5Quq+CyxyBqUC77qThViLGSbyf61/sWp4xT+E+K0cCbpojAOizDYyLM0F1FZsdcrarw9V13dxEmlOmNWSuM5UAA8LHrPwz0HfasSptVhOJPOCOCeGb6LC6OGBPpB0fmRZUxqLFn44WiDb4x2Or2z92SyA72FRnqkXW7xPlGqQTmPi9x96g5Xdxk3MybvIYWMDLKLIrHuwbeXAMJ22beD2sA+5XEvxJE1vrew
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(5023799004)(3023799007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0GcYjpqWTQEDL0ESyIVRW+E18TU4qCH1kZ7DJI5+2WMliYvC8HPQX6GSLe1q?=
 =?us-ascii?Q?LfgyubHEuFKHVW79R7XshKHCdo13lAAhJHoLitHMq4A2eFyFgiImDXiC85Ob?=
 =?us-ascii?Q?1FcXYNxdgnH8Goz0H+gP18uOYvowUBRSS/6g5aX5r4xvH8LdQH6FO+x1EcNk?=
 =?us-ascii?Q?oAJ97d4qak4M0zw3aQvfZwQPUruZWdIVp4v8Yl8UFkaxcq/3BCtBbnK4zRiB?=
 =?us-ascii?Q?I6QohqzLOEZ6zp4RE5/sazeMyZ4drUv4/oboOwk0C2Abc8wxaM84sjhRRhDD?=
 =?us-ascii?Q?RjnYaK3WyVIUnptC/7y08N0ic6wNe/dKrSYZYTaQo5a+8LjwXpO2IKki//Ua?=
 =?us-ascii?Q?hvGYcE0GyAvFdA2hZ6u59XQrqL6huUnV4AH5fi8gglzOc1nYip79Okmt3zqK?=
 =?us-ascii?Q?3DMsWQPLavDTv9zmamxsf6dBlGnYbEYNv+rGzo7wxY3xcfpVY/zUhIFAxVT/?=
 =?us-ascii?Q?+dHSrG7CyVCKITS17tP5z041tp5ary2gfUaURPjh2Z6rh7yGMizB2RSlyP8S?=
 =?us-ascii?Q?vj8BUh21o9z8wigCAde2T+ciru26Q48/9fqlCRViycp8y0azzjpLKfbsIgm7?=
 =?us-ascii?Q?tk5Z3Xn+79nEYFpQxSo4W4AOcDbcU0olMw19XdB7XzyIbSorCJUbFTfDBIf0?=
 =?us-ascii?Q?u6jUQPXfcHLWk/PMXPrLhbbr3UlesuU9WTFdAzp++hXX/D1TKTUgz+GhPNDy?=
 =?us-ascii?Q?/U0zI0RMuVnLPr+XlIe3NTLa+GalPyqT+p7PrwDDRfikblHftj7Y6LcEX9C7?=
 =?us-ascii?Q?1zECOhlsRySjmdkLSanvM6JWQNeDV8EYCxX2TPFZsb/NyXMiDL0aIr6LJEGp?=
 =?us-ascii?Q?LJUrnRWay3AT2cFWnaPaRz5s+ItVIe57EkaGNGI2LZXbJaELAeJCXvR5JWst?=
 =?us-ascii?Q?iFD8vsbQP2FriCXnvhvIrfrrnw1t2hNwbKacL0/g9XdTNKJx6P3qN4Zk2Fot?=
 =?us-ascii?Q?KrACuHTwuBZFDSu6OPoEGjTQjcoHDeR5KfkybHkTyDH6KcoGtFzPQIUU/nra?=
 =?us-ascii?Q?hyTK1nSUXycq8GUPUNIj3Gvb0nvcWYZ2v7/X+XSy5macUzRi/fLFogbBtHpA?=
 =?us-ascii?Q?+KjcquJB2BnnxjknVRJr+GYi6d/4RrvL3GYfMlsAGzNimoBSm3Q7HwQpAb7Z?=
 =?us-ascii?Q?Fg3FkrRPebw9QWOElV01AeLn6TC+g7/PCx4nxriaWLEvG5HNZNdFUDEPR/78?=
 =?us-ascii?Q?9eEPI8PGOS9QDZ42v21LCnVAciZHFJpKcR1KJbWdTo0iCfxeHNjo2dHgxfrD?=
 =?us-ascii?Q?OydO28SgaeQA+uCSm14voFIw4BAYk69UCUoZQdh+wTjAQWG1hXMVK98nR+nW?=
 =?us-ascii?Q?ZITBASVx/+pmu8BwBUddD9MQOm5w2PvAE182qeT1vIyKHB5/M2TMuTXqKauX?=
 =?us-ascii?Q?89IWR8s2wIkQ/h3g44H3rTR3WqKqw3EQ7SVSkVUJ8DVYCh7YxOI+SRv0xQD6?=
 =?us-ascii?Q?/IL4ZC+NcLlUKjU857+pBRGmHZmy5OnR+UYGRBMaWWLyDIKJcngfjYgwbiny?=
 =?us-ascii?Q?t09fepDNI4zeZAlBLQHHqmdoTUGr0pkPESp4sCBLv8Zn41841Rw32af6xc/Z?=
 =?us-ascii?Q?2uQcMvxD1TY+hShpKrCi2cXgelY7Hr5hvOiHCCfUFQ/bcTaoSgpxjmmdJzsR?=
 =?us-ascii?Q?31sMqLRa8khrsQMUMg0v8gzV/NFbSxYz5dxyaIIam/Ld8oUlLYcfNXc1heCc?=
 =?us-ascii?Q?lDGEPUwt6eK33te1lK9+B7tzNWRA1HpuRCtRDo1/GZu+Q6z+YqOhNkQLTmJO?=
 =?us-ascii?Q?u4D0oQBFl7trNlnEXJ+nSk7Bx3hLLUblGJm5pf8wc980eAgk/S0D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d3f4f2-2fc7-4be0-1102-08deb666e7b3
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:57:02.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDuPH41IB1ZZuh94sNRs5N+W7fagqkiwJVww+XCV7vrVB/OAXeEY11YwqrJA25Yi5NJOZ4ktpODVe/Gb2c+w+jsgdvEzyspgwgmlfwiGRrJcaYjz4cjuOmkcLSRzJ/8e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5499
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62248-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 9762358D32C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Himanshu Bhavani <Himanshu Bhavani himanshu.bhavani@siliconsignals.io>

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2880 x 2156 30fps (SRGGB10)

The driver has been tested on the mainline v7.0-rc6 kernel on the Fairphone 4 running postmarketOS.

fairphone-fp4:~$ v4l2-compliance -d /dev/v4l-subdev21
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev21:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev21 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev21: 46, Succeeded: 46, Failed: 0, Warnings: 0

Hardevsinh Palaniya (2):
  dt-bindings: media: i2c: Add imx576 sensor
  arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera
    support

Himanshu Bhavani (1):
  media: i2c: add imx576 image sensor driver

 .../bindings/media/i2c/sony,imx576.yaml       |  111 ++
 MAINTAINERS                                   |    8 +
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   54 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx576.c                    | 1029 +++++++++++++++++
 6 files changed, 1213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 create mode 100644 drivers/media/i2c/imx576.c

--
2.34.1


