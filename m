Return-Path: <linux-media+bounces-57887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMKpCCM1zWlwawYAu9opvQ
	(envelope-from <linux-media+bounces-57887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 17:09:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62437CBA1
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 17:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FDC930EA92A
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 14:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AAB311957;
	Wed,  1 Apr 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NO4/6b7d"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0A3F8801
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054285; cv=fail; b=r0iTtRym9RBhCyubw28hNVLaUf3p0xa1sE+2XsuA8re36NwNpfTP47bJFE82JF4+N8X6lELEv1D585djZQ9NQ/Nwr9/0p4fLLp5b4EXAFUuKWAzUs/sgMGLPuMtR0thP5yhiMNz2KEYiCuAdRAdohyesdegMzq+7bpi5JWGcaMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054285; c=relaxed/simple;
	bh=8qmVFI2i2gslCb3geEbbb7B0MnT5wxDCqM5WPb98Zpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RWFm4nyqDioUUH5BiXbqtljfHbBfY/euGQex77/L6ILW9E09De6lsgD/t3OOi49wK/eRFbqrpwxS5+TGGKD0p2pYjMN8Kvj4uTsI2Dq7PmoZmw/tBvR3n9oOk/KTnsfUFpjhoPnz2Yt/MMXhpgmd0IRqHOtRIuZIlfzshLRvK+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NO4/6b7d; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgNPoj5G9b6o0z1jlb/+mIPkxYfrt1pi/Waabm1xGQDo3xCw+O5DJvhC7Lhi5boly9RNNLUGVWH/8yPTvaDdDl2psAUVyOQoA4KH9rqPRZfhP5eF4T+1UI9k1xK0OvCHbJbbLoJjdG75dQ0YzGfnGDaSn7mZUD7pCCv1zJ3cTRSHFlhJx2oy2EYLaAR8gEdCculsc5mCCPYkXGSMeDLM8t85+g8oGxo1DS+6udnGBWAQBJk4miJpBnAx+TqxDhfgxzkTDdUmDuiCw8iZZ6RPhggwwWf+X2i/uWzoPUhtQqJbm9sVL+4c9tYmHdnTGeCQsn+l4SBcbJ/xZQQJ0Xd3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi0sBA9BgFxoD61qM3N5aBhjSgdttQKA8rMRD5V/Bnw=;
 b=UNFR7vC/aQgrusxc6dcc+QF0NMwGwnGILt2XXtFkYzglJJhUdY3NA1NDf/6C0YFRTxsJldD/WReciFu2W51XGJry4/jI92AWeKOHyABCFiKHqVO0tEed5Vzp3Ytfni9qwkFwmwigJ1tC7wRezzyJrfktbykjnSkv1Icb1QhYt33+te3KFwf5APDja+cGDMqNOfFvTmd00SBiKPajQbm1iMFhJr2Vu45/LXDm1fVfc/pM8qx9fUeaGgX9D9tzZ+KbZsPogWghJ950VWIop1j7Ny7bj5BK6NsS/ZBZ8nqlNQkohHRoqZ3gBGovwHtK4F3kiQyHfTJCe+M4nhaNGR5olQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi0sBA9BgFxoD61qM3N5aBhjSgdttQKA8rMRD5V/Bnw=;
 b=NO4/6b7drKRTbozYZ1hIEWOr69BKfkz6FrlaPsfdlb1c53Wku/WapXI8Mbbjb24YSjzb3+a/Ff+qk6LQfhzp+Qey3T1YVPPkh9phDTajT/9pLSn+mY4ln0daIQl4lmDeCkUVJr9Vg5ddWazfrtINsKkHZoglR8onpIBU8f5eSz93F+/qYUXtUd3MpmOIPWZnXoRtO36SNKd0qliOnn+b7MzEnVR14oSBoHKfoeVKDxSi9xaYyxivUX1G63qQL1gOjD9AYUGzqIHsG9znGfY1tWYXDvgl5yDwspYPLi8TORdNhncxhg5/MabOnGDutTrJgTQX7j2d8wVHuNsQURsR1Q==
Received: from AM9P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::6)
 by DB9PR10MB6452.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:37:52 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::54) by AM9P193CA0001.outlook.office365.com
 (2603:10a6:20b:21e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Wed,
 1 Apr 2026 14:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 14:37:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 1 Apr
 2026 16:40:32 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 1 Apr
 2026 16:37:50 +0200
Message-ID: <03499cdc-fe18-47ad-9b70-658f0c0dde7f@foss.st.com>
Date: Wed, 1 Apr 2026 16:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<libcamera-devel@lists.libcamera.org>
CC: <linux-media@vger.kernel.org>
References: <20260315221126.GA520505@killaraus.ideasonboard.com>
Content-Language: fr
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260315221126.GA520505@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|DB9PR10MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1d673c-7229-4408-9b73-08de8ffc4152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mZG1iOLN0XmbFo3UH4ZfdJOFHJkEYkg1UzqaVoLQwaL7NwWlcrvr+i7g1IMBlMlt6EmOocn0o+LT/mGOxWbs6+95kAbNq4YEbazQkzToWunQ2DUf/7Qg06BZiZAA7pkeL10xKH5QK5pBNWEQBTZwMCN/XDlMEXjIJOG5GovWfZ+valUbCx6CdG4NZd12u2hEUFMqyFUkyXExLrnCJPmoq2MPdPkLwlk3Ll0wNBwp3nvDu+2oPN/dqr2f1YEUZcZB7HtdnQ2smaqQAIJxvZygH9fG6FhPztjHoCYacmUP9wlK3BoD5f8rAfGxRxjgh742AiDrn+1qve92J/SoG3xfLSAix775hdmpCBnNdOxoCfV7svQFM00v4Ba1g0x5HCSUdSESwNBsbeXXadkMqIf2VZbj0i02X97xuSKpjKrDTLxyQxRuU7a0v3XJw1mYdUx0EW+Rmdp+D9ggeIge4gtn0CmvDkXF8X4RQtRnXv7b91LGyQVT5NoV11V0rmOpEA4l2KLB0CJeNTqoKz8Ph6TlJ9ujP6zmlXPtmgPYFosNOue+IU/kB6y2jcbLp/kKFRUFbNmvalz20YXNPMjjELnn5kpsF0xLvpzglYr/Am00OMnBou3XYnNP5H7RZI0fARlJmS0iVFF+tuGuP+DWC2fQTd1QV192j4E8SXJqVsByuFJEGWEgp3k8sCOypnhiVfFyqPiHKOikAvglTUU6vkKVQAfXXKLuE2mKaS7v6AzYuI0=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8d2oRDf2BdwrUphdxQCdngU72BGX/7c+MYU0szJwix6Zz6d2+v0Djx3r8ltMuJD4KJAAUKzla60imBVsnuI+bpgguoXCGzg7f1cbtO4GFjsLLj5UYSGMpy6n85Auv533tLiZ8EZXshs/K8duwYa54Ggzw8Z4Gn7r2T78pnZ0vwX4GJqcQgdltK3gNkbrAWtQb9jsWa6AeAlU+pggsBMey9Oj8lvCywvytoxa6EtJh8Tdzsj6RzIopZ629PsZH971o1bjKpn3k6W1XUwQd0+cYlzjP5p+EX3E3DQS707lTWLbccM4qG9dUQuv73aWkiAkQORfblNI4Ybgq3dO6GIDz8Tzo93U8JT0y0Xj2q01yJXj+nTVrkCSRnEMJFP3Zb4kVFtARSZVqtJkCi8Ejlzt8ccFSj4oRdHR6NunKS8DE+XYkBaSF4JJrD0LAHTfiMKR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:37:52.2801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1d673c-7229-4408-9b73-08de8ffc4152
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6452
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[foss.st.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-57887-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB62437CBA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

I'd like to attend please. I don't have any special topic to address at
the moment.

Thanks !

Le 15/03/2026 à 23:11, Laurent Pinchart a écrit :
> Hello everybody,
> 
> With spring approaching (at least in the northern hemisphere), it is
> time to announce the next libcamera workshop. After four stops in four
> different countries, we will pause our journey through Europe by
> extending last year's stay in Nice for one more edition.
> 
> The workshop will be organized by Ideas on Board at the Radisson Blu
> Hotel Nice ([1]) on Friday the 29th of May. It will be the perfect
> occasion to meet face to face with the libcamera community and to
> discuss the project's roadmap together. The event will be free of charge
> for attendees.
> 
> We will be part of the "Embedded Week in Nice" ([2]), a week-long event
> that extends the Embedded Recipes conference ([3]) for extra
> embedded-related fun. As last year, communities we cooperate with will
> be present. In addition to the PipeWire Hackfest, this edition will
> bring the Display Next Hackfest to the French Riviera, and the Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 26th ([4]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> after receiving topic proposals. If registrations exceed our capacity,
> priority will be given based on topic submissions.
> 
> [1] https://www.openstreetmap.org/relation/5130684
> [2] https://embedded-recipes.org/2026/colo/
> [3] https://embedded-recipes.org/2026/
> [4] https://lore.kernel.org/linux-media/92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org
> 

-- 
Regards,
Benjamin


