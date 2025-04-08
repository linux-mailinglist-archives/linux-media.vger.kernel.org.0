Return-Path: <linux-media+bounces-29672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429AA816F9
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D40A4A498A
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92A6254856;
	Tue,  8 Apr 2025 20:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ZdnBZYSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2072.outbound.protection.outlook.com [40.92.90.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC16253F1B;
	Tue,  8 Apr 2025 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144307; cv=fail; b=Xbp2M8OrtB8jBXrW4eYrvie914ol7xnhxvRUIKFQn9rKBD8l75OKx3AtiyCfWfypdQzzsWXGYEja59+upUOUpRiwCiMaZqs1JkB3T8zaRURqbnS6ozpGOctXoGNcarFjHB9p7hnMQAF+e7qhNzU6eFbcp+jMJ06X7JXQqhmg7Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144307; c=relaxed/simple;
	bh=t5ThA1kM/SIMshxKgFaMONO3dUFOy4EZgYGqRzOqrEo=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=c97fjuma+7s98+h/vfJcALg8vEyZYnLzAf0JiHikP826Lr49NPD/hEh54693v/4IjC2/Ld8Bu40jxpC0YUzkcdQlgix69CGqQBTYEYsWRRvnqrEVp9FbgHsMQMs8xbY/h3BZvSgYoQVhmKfOuQwZBHfMTwmBDpwJjARUmJVueJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ZdnBZYSJ; arc=fail smtp.client-ip=40.92.90.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGlufAptMajQN8ibMsnoHojNn9QNfkKJ3IRBabxFkSnymRtMBZrWeJdk/7VUVJwr0SkFBnfp1kJzfQcdexc2JlI+3Kx9dQV85x806WDtrMXOBZ4sz4xoEw+So81lV5NfPbHP2K93U3WZOvPHJjiLLpsAjw4y2NM5wJfx12KnRoAGgiXrYjE5FE/CYS+Gd1rE2tR0klv2s0h39g+LvNK6MMV2hj8VXmuSCVAFIZ5N4MzrL6dZGS6p8u1Ir2abuS6EO9TUJ/l4jW5l9FcZmnm5mWFt4uRfK08KrX9g2GSheHK7gpMK5fsajo9tzr07j3ueosdVYPE86CibGqMhJrP39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAmLwbfxyLCToAs8T5Ll0bxlX+U1hO9PEI89xu4fyVo=;
 b=UT5KJ5QC8mG3K0hcwZ5PrNly1t8kiLMFcJZ52J6xPnSjS1JVsl4qJ9Q8EyO782ziNhbeKbJ/1im8fe1PZ7rspGk+ThYWmvVuWgZp7O+PrWwvfq0j52am7GGX80KXL7uvphGO70sAdyD6XDId9jsZBRFWtSVO2GR60aSAlE61bU7rGDA5jzdht2PKtWNyh19Z0R6TM3vKhXjKxwxzW5ESnHTiYcli63smUB4LfAijlU9iEQK34IY54rZFkoSnXB+o93uBw0nU3YPjnqbCvXPVxBtP5KO80GRopKSIA7fywj/a7TpivT2VpiZI3juieYZTF7Rz9S9lxsGDi8PTLQTonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAmLwbfxyLCToAs8T5Ll0bxlX+U1hO9PEI89xu4fyVo=;
 b=ZdnBZYSJhVg0bXYgUlvKl8/VCKsokw57jF6xX5BgKXkQZFZt3q/XtEKakoM77PfJF3WEwZdsZLSzXN0YSqqCTtOPzUJO6vlXEfzl3+9J431HpQcGJuyzbQEmts9tmuXNw2g9ALYuKPvfWjikFrf3bUMfipBv5fikD40SrJCqgNlHiuAuZLfjjIn4JmPWjP18uOBh2lqdGRnpqZuxc72YbslJ+5Ebjw9w1gTEdMisiAMQf2Rqvah8nDrswEC+EEQPShJvoo8bXNzYP++Tjwxyze8RNHkBcXk5eTnt2EhiTDIuPGCQxoYoUC/+sujUb2sLScJeWjH1HCXLYVvM1T6SDw==
Received: from GV1P250MB0716.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:8c::8) by
 GV2P250MB1047.EURP250.PROD.OUTLOOK.COM (2603:10a6:150:d1::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13; Tue, 8 Apr 2025 20:31:39 +0000
Received: from GV1P250MB0716.EURP250.PROD.OUTLOOK.COM
 ([fe80::fa5:9fcd:cd66:534c]) by GV1P250MB0716.EURP250.PROD.OUTLOOK.COM
 ([fe80::fa5:9fcd:cd66:534c%5]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 20:31:39 +0000
Date: Tue, 8 Apr 2025 21:31:25 +0100
From: Chris Green <chris.e.green@hotmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l: subdev: Fix coverity issue: Logically dead code
Message-ID:
 <GV1P250MB0716680153B0E06CA96AD94AB2B52@GV1P250MB0716.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::22) To GV1P250MB0716.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:150:8c::8)
X-Microsoft-Original-Message-ID: <Z_WHnTcdLm3iPpdN@chris.chris>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P250MB0716:EE_|GV2P250MB1047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1ea136-9f01-4f48-e161-08dd76dc5d86
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|8060799006|7092599003|19110799003|6090799003|461199028|5062599005|41001999003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJk7t00SEeS7rSudv8sAQ9FWr3mV16SVNxnKdiq/+K3a7ekyVzRs41tPOJmi?=
 =?us-ascii?Q?qbKy5E+KMwV/cbRDEEFrmyKL4R6SGhm+WVRC3dt3BULUXICT1eWeNZuEnGlR?=
 =?us-ascii?Q?fOVsHxpBXIWeQSZKO9lTeG9zGhwyrW+zjMGo8O+Xs2HB/cHwWxAhx5WfTdqM?=
 =?us-ascii?Q?p7CL822Lf0UXicNwwkNHoOVykeecf7NtSfDtGljWxLz8fbZyUUod8JVthp4N?=
 =?us-ascii?Q?H0MpzJV3OQsEeanw3v+x0x4GRROW77MEULle+z/l+Y6OJZsyJ8aSbRdm3jNd?=
 =?us-ascii?Q?5ph8Qrej1pO5L6gePcVwuXH+VFadsaIPN46Vd+qGk74XTXVOvt6Ctz3oyvhH?=
 =?us-ascii?Q?1F1c48hUI00eYjWtPwZAmE0ye6okpHlWTYjtlfZbAZni8DqMCdIlzQf5GvHC?=
 =?us-ascii?Q?TzgC1Gysj6kWXdCpiVyQDjrVgWhHDnCV/o6O16RhtFdQtkiMPThmT3eC3LNW?=
 =?us-ascii?Q?h+dIddx0LrEaBeB7eLSDZhuyz4yR4526TLkCpUbtrkhmpfMf5aKDyyPhVtC4?=
 =?us-ascii?Q?7quS5DFMdewQuKj91Kv6CHeHXPljXFNu8zBaB7xY0ElgeRf0LOPpi/BX9Zh/?=
 =?us-ascii?Q?pnhwaWvZMCcH5Ovq4N/pNKMowsRKOzdM6EGk0mmFNbOpcKsVm5rnSB3s3YQe?=
 =?us-ascii?Q?L/jXno+OASs2AqZE9+sAjVIf9sSSkDxZQBvyPjcnOCBDctxx3FT3r+VDhihE?=
 =?us-ascii?Q?Apq8rKApOatE4zXR8nfhmVMt/dKxdLMzPL/aVPk1a2axmI1YfugaH3RrAn05?=
 =?us-ascii?Q?VuL91V3OYjbIX9J5aSiD4ekGbVKcwis3N6HYNieikD2wJZ0pELnlEUryhXrp?=
 =?us-ascii?Q?giHc2OpvUI03f5mKd5tpZTJtpIPWeqSg+GiZbq23gVu1U2XCcARKHsNcbSWs?=
 =?us-ascii?Q?kGQtXrUzf6x6ovap7+UkrBvgraRIeT7ELBSY0UnIyzEpyf9prR2Vd286RiKE?=
 =?us-ascii?Q?BXQs4YkNybOsBs/zj+3w98DhdQUM/OZOiz0x1zckxGjhAGexvO8tjdLlwTMv?=
 =?us-ascii?Q?REfFKd+mZkcCXpPJXdzFAQ3SsJlvTpeqoxBTMlz9lEnmC2tBi8lKd6GmPAMe?=
 =?us-ascii?Q?IIGFzBzssOzQCmIF5dru7SkzlIDslrIXyjPWM3EKx5I/kgKDxfKOfg4JYVZP?=
 =?us-ascii?Q?NIakdgaux+SNK0D9OOhczRphdsRrTBhOI1wNsnpgkm3D4GSOKorwJKGd717o?=
 =?us-ascii?Q?iQfUhK2JD+31WfvMe48rCnj+CsP/mtOyf5KBqg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yxuyDX1uwkyUhKMN6kqkj/vW4ZQDDAKcfsfZzh2vSM490HiKSHGFqwOIC8Gy?=
 =?us-ascii?Q?xP6ae6bKEZTgJSAzCWU0utiDw+dbkTBNoQ2c6h451AI0GUp9h8VpgnFXla2I?=
 =?us-ascii?Q?l+Mxdw1PN7QHUc1aJAQaD+M6c9Nof40+b7k56iaxg8LYZLzl0z02h1y1A6nk?=
 =?us-ascii?Q?B7SsJRa4XdplpspuJQtYtuL4/f8E4lQEnuhZ07/vzQ3He56fRfzVxLPUeeRt?=
 =?us-ascii?Q?py1R0L1lHi82185ieoYDm1L7WaoyNDs+2eD75eavtWWADKJcJcAQYsHgHCT6?=
 =?us-ascii?Q?XUwny/g8tvUnNZHFbXrxBrIIx6p9wGIZFOz00nmPzvG2ELgFluCgKn5kCG0U?=
 =?us-ascii?Q?lSnVf3NF0aDmPTHp3BWvpH5yvSCyJI9XfgOiI8zIcYgJ4dbbzhAdjx2rocFt?=
 =?us-ascii?Q?zv3m316zHjgXV/fBxEKS8dhMk78qvpF5OnbGN/txXvNrBTO4sn9n1sPzKlUF?=
 =?us-ascii?Q?SDtbL08qhy0mnKGb1RgKwJRXuN2HEiZ2VMSdqvj2YHB4vvTvHBr/spm/Fmn8?=
 =?us-ascii?Q?pKaHvNSPVUv1/YYt6qngrfBoAZmOlnbjqv+bh7Oq0EnNvFVrg5e0EKB1W5wl?=
 =?us-ascii?Q?AQRBQ9uzHva9ztrGV/wqIzUjOF0Lkp82nuZLXhiSnD4F5EylHn5E7vRHIvMK?=
 =?us-ascii?Q?IcN32RvnV9ZjERMJ5NW4Chv7GBFMz0thSHHYlVaFokfcTwN8n222VGLg+Hzt?=
 =?us-ascii?Q?MzXqLCAmEIcWHenK/KlcgNIYM1DJgR+FTXw1Fq0nyD83n/Iv/KOPh1S/nPwu?=
 =?us-ascii?Q?Uq7sAR/56ZveYHiPj44Oy0BTm+OSwOx7iCS9z71cjadiEmf/tQQ0uJs+VEL9?=
 =?us-ascii?Q?RTw7cf6Ni8Vz1QKYvJJovUn5COrVmEo05Jhw3SiQvBDwxcT6U9znEAwDcKgh?=
 =?us-ascii?Q?6S+XWJMVbGH7mogwu9Guh5kScdJmcYeOUGgp+/ValimGoS1lOai5UgA6IR5g?=
 =?us-ascii?Q?Ub7RRS9T/ronOfJLhthHcXa2iIcDjzUQosBE0FrqvWvnuNVQBftiEfQ2TrvK?=
 =?us-ascii?Q?77YP0QINpcIO9WGEQ94D9ug+e7gUreXjlTB4Tihf4UvoPrDQU69iPNfPyRmC?=
 =?us-ascii?Q?wdhvsbaoN12Z7zG9nEeTxaD8Iqci/e18BiAd31qmHqHj1kUQ5C+WxxqFOB6Q?=
 =?us-ascii?Q?j+0m8QPf4YgRu9xUtQz0/Vrj9e3J836hTlQBu8vBhDWVjxmar9WZ9ESiU0ss?=
 =?us-ascii?Q?BLxAMkrCmPnWA/MNsthTP4BIT/qPtJ5pzQ6kbcAjyYNkLatwqHvXreNlOEms?=
 =?us-ascii?Q?wMrf64PUdgLbImEkBZA6?=
X-OriginatorOrg: sct-15-20-7784-11-msonline-outlook-95b76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1ea136-9f01-4f48-e161-08dd76dc5d86
X-MS-Exchange-CrossTenant-AuthSource: GV1P250MB0716.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:31:39.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P250MB1047

The conditional (type == V4L2_TUNER_RADIO) always evaluates true due to the
earlier check for (type != V4L2_TUNER_RADIO) (line 2826)

CID: 1226742

Signed-off-by: Chris Green <chris.e.green@hotmail.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a16fb44c7246..275846a6850d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2833,8 +2833,7 @@ static int v4l_enum_freq_bands(const struct v4l2_ioctl_ops *ops,
 		p->capability = m.capability | V4L2_TUNER_CAP_FREQ_BANDS;
 		p->rangelow = m.rangelow;
 		p->rangehigh = m.rangehigh;
-		p->modulation = (type == V4L2_TUNER_RADIO) ?
-			V4L2_BAND_MODULATION_FM : V4L2_BAND_MODULATION_VSB;
+		p->modulation = V4L2_BAND_MODULATION_FM;
 		return 0;
 	}
 	return -ENOTTY;

