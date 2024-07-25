Return-Path: <linux-media+bounces-15324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41093BC5D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB221F23A12
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B7116A938;
	Thu, 25 Jul 2024 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ebIQfi0S"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021106.outbound.protection.outlook.com [40.107.42.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668AF29CA;
	Thu, 25 Jul 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887858; cv=fail; b=GBwo/MxLnVk58NkA2OLYl1skpXWVZt2ObJ5cQeHpjr07AZeOmqZQZEqk2AwNekjYOBXBQxc6j1Zt7t9BQI03rxDA4pLM3eNWkPZlYpMFHWQOMCRiJTZuAswJsplqSoVDNhdXHddJ6LgclyN4ZC0o9iJFcPODnbMmL5Egu4E7CqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887858; c=relaxed/simple;
	bh=n42QknomB0eRjyzkOmOSEnHUuWaBOEpUhLf1BhUTDVs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=EyFqRXdwwIKLXbQiWQ8ya8DtUT9MwGYQI2d4y8tV4Qu/+jFekRSN7FT1L/M8YSqM8Ju50655KZ0GSitGMhOs7Zs4bQ4pwKq124IKd68sUnLpAcU7ChIE6aH56u513jw+7XbWCL1kYQT8CGrGy+L/xalBmNFoesQN/MWHRp0NiUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ebIQfi0S; arc=fail smtp.client-ip=40.107.42.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4D5ifTxKiCsMYOYBL4a8Ut5JNcoF5c2T/slq2EUeb4MI18Kweesx9/a7QfzfmYwEmz0otS9jGRi5sA3AUE/CdGHnxJ3pTLo3ABuWggHWlKFRtnFDwqDiPxkMBzIqQoffWODfWBoU90teMCQhdNI4ftckFckX5VIl/GjRhRBrM3eSJntuD//mksBuWlfTbHdgNZ60RxWs1rHV66Ze5wY+J7mfmVqhmwBGUWvK34E8xYvTJFtrZl/TnAGe6f6hH27R4plouaQWU4ODq42izsPQCoEMQLWZyxMA129ORLnheGf8woJufJ/dhnlPDwjSncEJ4mI+yCv3bvCJTAXuWRG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gfbD4l+B5Ck8hjmXNpAD7wx+nywNzu6SATZfUO3vuY=;
 b=x9XJcnQsVzQrLqX2Yrf3JBBqXZx/MJKigBr/UJvhwGRVRZ2OKIVWxKDCXjcWQ3jYyXFrLxlG8KXWwO01a8No/wCXVZvk8aKPw+ecclDIQvvorY44OgwLvYw3hUSkH9uaIg7iFNDXB3diEmQsL2nVR1+Yw5d1FHqnvRa8+9l/upuzEHM5iBCCfvmZdAkCg+HpekUWJwjYDfLEeFdeM/1tl5wn+BKyFdrsf8xT3LJwHkFHRH8QLoxo3fPsj2Kf2ibcUFAa1rMV3FjbiodhWM3ysrmoPi2trnOpDOTNr0xZ1XW8ueIwEOGbapAPovmq8QByF2V1mP+zTw17VkHHcMAbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gfbD4l+B5Ck8hjmXNpAD7wx+nywNzu6SATZfUO3vuY=;
 b=ebIQfi0S1RjgEKbgaeAx4417vwHXVqoqYIcLFDXSor+N3P0tk90q4z7w9ACrUGqtnbguzC+7Z1xxuvFz2psQle3NUKSgC+CTgyv0n7b8rZL/motbic2G9sZbwY3cfH4gK3byL4YPGz+YQT+44XRNPpR4o2JaqAtESaal+U3evhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1880.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Thu, 25 Jul 2024 06:10:50 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:10:50 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RESEND v3 0/3] Change V4L2_TYPE_IS_CAPTURE condition
Date: Thu, 25 Jul 2024 15:10:31 +0900
Message-Id: <20240725061034.461-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0009.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::15) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: bb934cbd-9a56-4a29-f842-08dcac708888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FPZuYG8ck5dj9WNlgFtNyCuYSK1JbKR4t0lTFRjlanjVVxeAayTBIOxEhijh?=
 =?us-ascii?Q?DwguV7OQgRvx6Ipv1UBpCofnmPhNyEbC2OhWBjadV4yHYvMFlgmytJb05Kak?=
 =?us-ascii?Q?mwzPmcH1JaWVZvDdujFMomqsfPG+7OpxlhtiXdjkswM3ekd+ewR2prPjBOgq?=
 =?us-ascii?Q?PDKfMNBKNq5gC2FOSRHo+2VVNnj7ZVqKC0QkbX7uMw/OVDiVSRFDChLx3FnJ?=
 =?us-ascii?Q?Me1aOTQaJdYErFY0Ff+SvWvs8hTN/eJEKesyxB3wr1uQOABgshgMMquSkE9R?=
 =?us-ascii?Q?c3qLCm94CA7P5biILaINC1KVeE0SbM/Sdt1EmPRhgEbXAwtn1fpHzHPvac0W?=
 =?us-ascii?Q?fqw/+96c49Pq3vNBTAuwfXsedfZ3pJMetu1FWMoHHjduh5XBg3gdrCR9TpUa?=
 =?us-ascii?Q?7Zjysc/7hzowtUJuovknF7T0HQA7BOkmvPAKro5JiT/1+4NJP6SirvfU9aoi?=
 =?us-ascii?Q?OAvLhF0QGC70MQBPSKOnOTCrp0TGy0tYapYhetMY5t8dpBoo1q8t9HSB/HmY?=
 =?us-ascii?Q?JcIA3mPVXCMR7iRyIGgHS69w/iickqunAfOHcmXiIkkM3L/eVa8WbdMknwMD?=
 =?us-ascii?Q?JZlxpgypit8PZ4RQqxE6KK/a84QwG3rgA7qWEors14Ux98PJz0hTDRuelEi8?=
 =?us-ascii?Q?AvtgE8epp3Rh26bvD4UmibEvM+fvciisBo8gjhJmNN0aqnawFAZDUuZzc6yP?=
 =?us-ascii?Q?BbVW4CSifsuqHoIobxVgUvoGPJgAsAD0jGRXoLqTRLJX/togqANg9k2bRf4v?=
 =?us-ascii?Q?1HPW2y2vop9imnzV2MhD2M8nG8xLBq9qxbS/kh0Jq/jjkHGgDlF8UatgGe0z?=
 =?us-ascii?Q?wygMKv5q3NLnaJmbYdM9/Ymyaz8mPg70hSRClVBoWejlrQORvWSrTeQKK6GY?=
 =?us-ascii?Q?YZFFUIgffbgoRbKPnvPOR7WR+Q3bnXgmRgYwTHten6VOmHcbmgOvFD3Scxvf?=
 =?us-ascii?Q?mgTfbZSwk4VwGrUERVdULhvzJ/T3KyVUmNob2+0eo6NsC6IA+j7Gg3WaCPKI?=
 =?us-ascii?Q?vyO2wRNSGrNSHy9bz8mY38TwYcsjKLd68AOfl1yYoROe69CElA1hvyPR5TTl?=
 =?us-ascii?Q?rQnJGy8Cbq8yVqTTJJg4ca351+SChYMT2bl1yCYlk36QHHvBAmPBWfHc9XZ9?=
 =?us-ascii?Q?9bkxf/TLDVp6LznwB+/ss7/ww/VLVR1hbe1hCznKzrXJtACSDi5A4AvkkFij?=
 =?us-ascii?Q?520+VvEoIGoXrIr7/bbf2jkJtVVa7nXlLkOQsLxOs+6yAqVXrpiV6lyQlv2G?=
 =?us-ascii?Q?+7c2g59t6zHzah+bP3s2Cfjc70/ZVVtapp/E0KDDIeSvw+54QDJYhrGh3Kwk?=
 =?us-ascii?Q?IWrfomWMxztHHKJgdjcBoBAJgfFQkHjmYZobdaa6jYeZBphN9vo9yT8Ggy7p?=
 =?us-ascii?Q?wtBmc4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7VIcQ875bAKzT5yp/y/mN8YPcK08cHESPEYyL+VGWPHiDCrMVeE9gQeYXbG?=
 =?us-ascii?Q?XR6s11Em3st/Eh5Dq+SvfE0cYozJO6ZUO7RUz24oeB1L8sh531NXJJRWjqkJ?=
 =?us-ascii?Q?hkCXamnrQ0IO5tGAJTb3fJjEEszmAgK+/gjp6x1sQOgUFCEOLF1zqA8AjZfF?=
 =?us-ascii?Q?pzliXWJtCbLawc/nQgzjJjtybP+pyh0dNhtACtanShe6R13KQ38NFEA9j6JD?=
 =?us-ascii?Q?hKwUMT1ko5MFSvPUrEAJfJq/7dDp5ZaDUchiTAzCi6hdrgDp/Uxrwqjb9T24?=
 =?us-ascii?Q?840EbFiSlCW8en7BNtnFxWKEUtCfLYjKmsrnApmQIjuw5md2vG+TC2bB2b58?=
 =?us-ascii?Q?Cxpvk3pnXBOOvr+xxi5LOYl2p3CXRraiAGEi7GfoAVQPSppTRT75jjylj14i?=
 =?us-ascii?Q?D1UiCkMBbsfipLEFSNmYuyX6awASLOFupPAm2tANCCv/l0H+YTyhY2HLjsum?=
 =?us-ascii?Q?kM1EzRY3bZj4khfwIPZi0tsQEm1jE57haHMk4frwoe+K9wAdoHemJrOh3aPu?=
 =?us-ascii?Q?Ag8z1H03i44SGOau6afFyItTBs3CCU6w37SBZIzgUauPnjwJ072jzUxgMbn2?=
 =?us-ascii?Q?GKLRf8wgEhZSPFQyvGTW1lq+LixKbXSn349Md0QznAi7kIZpq++Xao9DXIXY?=
 =?us-ascii?Q?baZWxmrtHcrEfatr9zLvpMvldyu28qJaJ5Zwp75MrmlA9lc1oDiHGgmepM8f?=
 =?us-ascii?Q?WoukZf0d0FYzC3nI2HrnVMDXDe5ihT0/pmkQ2keu9k2mKwFvIOb1ujygEll2?=
 =?us-ascii?Q?FnhbfnAN161NFfJcC28zgjulXyfCCuzVDZCs9tGTCGQVMOeoDXqQqf77DeDZ?=
 =?us-ascii?Q?SqL6JJFnycJFQNCD/SIJw/7DEWJMPv5qvdeRdOb0zOklV4QGiPpOdjeMauUf?=
 =?us-ascii?Q?lv0vIwT6khw+pFU+IBs3xsWHjCB1sVYKGdXk64IQHSXfBGE+Q2eg0szBCCnV?=
 =?us-ascii?Q?sEqM7QVjHuntN+/Fpknk1fZePbwPpT88rripbN2ep99OiZJ3LcGSSW/p790M?=
 =?us-ascii?Q?gf25OAEf4DUcgNXuFl21H0k6v3QgtG49pLnY6mEXs91g+8aED4vhDt1EL4CU?=
 =?us-ascii?Q?2TGfNYy3Gmw5Tj1l7qArk5CtfIJYim+7WC++MWY5+CO7iuf3sIzvziCKCufG?=
 =?us-ascii?Q?TqIhpSGLdco68xYSEzMj2IJj5xitKdkijeHhqa4/9/V8ciKqsw4WnsxJByns?=
 =?us-ascii?Q?Dlbz9v50Q9L0/hVd525fLQQP+aQMX20zoWpRWixCrsOmuSbxHsjlAD4JTcg0?=
 =?us-ascii?Q?+f7fy4c3OcL0hg4zn7ZK7r6koxgNRbbICotRnbN36Nl1tDvu0teptkPDuyxe?=
 =?us-ascii?Q?2F9LdIl7tUYREbyueI4YfCKIWm1wTJ3/v5dazZbWVjFu+XwMtTxeeFIf2ykb?=
 =?us-ascii?Q?DaqzEoAGqCr8ZEdb6yEqYFt8vAkIJxYowX3f8ucwxqJVAbQAeTpax39kve+I?=
 =?us-ascii?Q?MY81/20Y82Aa/MgsagDYuR8w/MwJJ+96PpgW9WiJm5v9u3c+pMVbqUeU7Ruj?=
 =?us-ascii?Q?/2nsY2bsSGYuysexOUypdy5gTbRtXYAuY/bIKqw97JzqtQr9b8kjWIC54Xmx?=
 =?us-ascii?Q?x6/NL6d+AU3BGOYpQDybmp6vuYgmYm1dC7e6cb+93A8Vq9o1zZo5KRVww8K7?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb934cbd-9a56-4a29-f842-08dcac708888
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:10:50.7835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcXSq5SMFOKoG9rp/9PN9ohUaFWp8SRYa1ZujMtRMu8SzMU0ysi+PdCSibw1Y72faRgtqqEj7LlUCbz53hdPx1GpVeLoq24Jy8SXX+9adlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1880

Hi, All.

I'm resending v3 patch series submitted on
https://lore.kernel.org/all/20240604051120.9441-1-nas.chung@chipsnmedia.com/

I have included a cover letter to provide additional context and
facilitate the review process.


v3 RESEND
- Add a cover letter

v3
- Adding a comment after "V4L2_BUF_TYPE_META_OUTPUT = 14,"
- Fixing a build warning in the venus/vdec.c code
- Removing V4L2_BUF_TYPE_VIDEO_OVERLAY in V4L2_TYPE_IS_OUTPUT()

v2
- Improve commit message
- Add V4L2_TYPE_IS_VALID(type) macro

Nas Chung (3):
  media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
  media: qcom: venus: Fix uninitialized variable warning
  media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition

 drivers/media/platform/qcom/venus/vdec.c |  2 +-
 include/uapi/linux/videodev2.h           | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.25.1


