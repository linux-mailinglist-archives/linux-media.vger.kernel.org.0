Return-Path: <linux-media+bounces-52019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK72HsmtgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F1CD096
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7963E300BC43
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8FF36CE01;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XyO1WDKq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A8369988;
	Mon,  2 Feb 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040695; cv=fail; b=Ba6vnhDg5f7M7pnMWGxql2fo+ILJRlrKBrpGsxvqJQKc1vcOcVAyaCf6eud/s8nGCMEy70T6HamHfGqNqN0Htn6xonF61+z1e/LM4+Ibmy5WO7i3EkkBLLwDyRVlBiPLGpiIHsYXU5Rx9DwnpCOoIeFavuE5ISOfNnbVIGr8Cws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040695; c=relaxed/simple;
	bh=EAHTRW9E75QcK5pTeCd94V6QVtQZjgjQg5ZvqAG50a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tZUl7kmIn2ptOazTKMUrQjlu9OO3IJNTPWD6KKlPKac/8oCkOorAoY+PYkxxKp0nAVKgYAOzCT7wMWol8mapCQm285Z6AILQTPECP7s7+N0cgQ+wcYlR5obYQ5KWGXXqtGADpVnmNnJoMmPvxHLazq15XvCt7KDvFGm9ktB+JHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XyO1WDKq; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Da6Mk2888215;
	Mon, 2 Feb 2026 14:58:01 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1apvx2qa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:58:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzJjIr+KvBGQPyBW67KG0EmDr2dUmcg2yq+d07SAqJsmEWNShRJP2lm4z4JKA9yVZRKuA041TsCCWf0D48Wo5w0ui0TcTqJl1AjAc3Sl3KmsAmkVUzxld82kk2+LAo0v/dHREoRzuqcduvYISfPMfjAZOLDk6hVhb0bwjh+fjemSPUq4T1oFRCCqmTJc2ys8Xc1YOsYdP2BBs3qGmCEY+8IkJLe1wvAB+47Z3qieZTU/y5p9LgdvCH+bIr8McU8CwARhhSAP57g8/Jg0cUpuUOuxz81FJDK8hNUN8k7v0d6DsrbOUhoVEu91fF8ftmR7Ll8+9EkxO2Y26qm731Keqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp5517Pusd7fHxVUXRM0gf5oDQeFk1ntBoqH6qnQnrM=;
 b=D9zLZcDvFgUNV6ah8izMf5fsGqRFT8cZjNOlGx03s8uVeuDj/kaWW998gVJI0fl0SLWz2PtQMKq+Av2WMOsA9ZBByscssyez1hXlhhnZwlr06CEcCWF0UD7Z4yzgaDOj0PIviURVZwSsl7PSWaJG672lHB7V6bmtjuNV07Oe84a/hywQWjiWb0T24IZ3dFtsKbdcz8GnO4ck5cQ1ppPzTZc1NvJg1HPGmT4qt9jFdoNI/tP9KTkvowxr1ISZyIjZTl0Eg2vH+N2QTHGQLnEle3VnLFXhdl3N/OxFLRji2gHNKKBBejf8frGop9hYr5RS0Z5vc/UN2AkuI+y9NFHhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp5517Pusd7fHxVUXRM0gf5oDQeFk1ntBoqH6qnQnrM=;
 b=XyO1WDKqHrLowLGiFTStzuAHzNJWYXG9CeonC9hSgJ2ukOL2MTR+6c9e2IU+3OQHh2jGqJfc0sYmdLbq8a3aFTDsm1RDsVwF/l/kf9oIHYiFGI9RMTMaIkxuRILx4MlkboybrzZpRJoSPlagAOcI7taD3DqR9tTW8XR3hjDNGMlqZpDJZ5f8BPg4VucShvs+pJbI40IhXgP4mbqgJ1XXS8YbklXFKq7Rvf15OllC1ukE8+mcb4iQ6EZt4GLhPGZTPO7ZCGaSe5BE0oBgvrQSaCW7s6fTqGy0JCCyTiw3CWVuV3LUKJ3RhaFfLUBbTzVCvu0UX4GmNel2BPkDYRT9Kw==
Received: from AS4P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::7)
 by DB9PR10MB5593.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:55 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::68) by AS4P190CA0001.outlook.office365.com
 (2603:10a6:20b:5de::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:40 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:54 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:38 +0100
Subject: [PATCH 13/13] media: stm32: dcmipp: instantiate & link stm32mp25
 subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-13-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|DB9PR10MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b582dd4-fc98-44fe-83d0-08de62631086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlhuYmV1S2tkN0RqV2NFZVRLZFQ0aFN5ZEZvL3FVM0QwZlkxSStLSGZrV2pL?=
 =?utf-8?B?TjVxOW84WjB2WHlVd2ZxNHFpSmtHUmU3NUtDY1RPMGlZSmhVMGlpRjkvMFBI?=
 =?utf-8?B?R0g4aUcyamhzMmNYaC9BTFBNbHFzb0JLQUFzV0JWRWUzRnhYTlFoSzIrcXgw?=
 =?utf-8?B?TDVab3hsclpaQ2tCUzl5eG53eTBGbURZR2l3RmlnblZlcUpkVXNTQXVtWFlo?=
 =?utf-8?B?VjNtOENmS2xrdkhoUUpnTkdUMFV4eFlrZjF5R1FqYnloQlBRRDNqQUZMTTF1?=
 =?utf-8?B?bmkvcFM0bk1OL01yUUF3MDc5LzREK3pOYTU5TXAySTZmbGFmWkkwZkpNL2Z4?=
 =?utf-8?B?eitwd2dWdFJ5ZStUbmFPeVlJUlNWcVRIZDgzQ0xhTG0xYmI1WVp6VVJhL1FO?=
 =?utf-8?B?N3F2NDF0STB1a1RtWXNpZjVObmJnbFdPUm4zUlNjS2plVjJ2eW0rMkNPeXZB?=
 =?utf-8?B?OXM0cU5DQjYvU3FxMkRxenU5ZUpPK3lMQjFEYmk3UHEvY1JSM2pGWDFjTDYy?=
 =?utf-8?B?M3ZESHVaeU1MVG1jWUp5eTZ0VDlKck5KNElRZm1hY2IybkVhd1FuWm9TaXVW?=
 =?utf-8?B?K3N5anRTU0NmY2dOcmQ0NEU4TjhQc0NvVGs4b2hiMFN6TS9CVUVnaDR6Nm9Z?=
 =?utf-8?B?N0xTdEcrb3VkRkRoM0grT3JtN3VuUW5NNThhT01GUVRUWVlrS2ZHYWhGakhW?=
 =?utf-8?B?eDVKWlNCUjNnMFZISGluSWRzVk9UMG5VOFhaZktIQkJzdmgrdVMyTWxOekJQ?=
 =?utf-8?B?VnZLZHdUTmFTemQ4bmI3amExNTlUSWxBUXVSNnFKbW1DSGVaQ2ZrL1hiUjhC?=
 =?utf-8?B?d2lLejA5d1U1cTBPVGF3bVBmeFdFV0lHOXdYWkZqcUU5UU93M3dFczVNNFhw?=
 =?utf-8?B?ODRZTEdJS0cvTlBRWDMwRHpqOVRtT3FnUjh3bW5LMVNrUlczYXlhUHlZZHBH?=
 =?utf-8?B?MVFEUXNtcTZhYUE4V2x1NC9kUE1RdHR0UlZGUmM5U0VzcUtuazhSQjF4Rmpq?=
 =?utf-8?B?NHV5Qm1zaGxybmpUYTdEUXdPQW9VQk9SekNyNkRQVGE1MVVQTW5zTUZLK3E4?=
 =?utf-8?B?em5iQjJheFMyRE9oTE9yUmhRZDF2a0ZtTWhYRmVlMkF4dEIvRS8wTmkyYkNP?=
 =?utf-8?B?WmxwcndxV1pBQWFpWkZ5MDY3dW01K3VGUlNaVmw3NjZnR0NDaXJncVZwUjFs?=
 =?utf-8?B?aWFNdE9IOVlyNTZlVFJneVlXKzlBQ0IwWFNKNFRZSmNUSXJKYTlXaEI4N0k4?=
 =?utf-8?B?M0Q0cUtLS0tCNzJmREtqQ0VaQ1FaSHdNZzVEeWx3VGVvWHBlWWg5TytFd0ly?=
 =?utf-8?B?ZXM2RUhzTVNPWmdvazlMOWMwOEx5Y3Bjekt6OHd0Wjg5a29mNXZIUlBqdDA2?=
 =?utf-8?B?Y0x1Rk9BTENWYVphTERsYW5TSDNBbnRZbmsyVlpIMjhjU1d5enJ1bmJyWjRR?=
 =?utf-8?B?c2FreEhGL0RNRXpTT0ovM0JTTlhxQS9mQzcydlI3a013cXJ4c2UxOFFKN3Fx?=
 =?utf-8?B?ZFI4ell2NjlCWHFsZVRLcXdCaTl4RXN5c0xHS3hWOTV6YzFLWSt1Wm1PYjZ3?=
 =?utf-8?B?cUcwZ0pmRXJFcFBkMUlYNWNidE1LWjVTTkZYL2VKb2s3elVlTitoY29ncjlY?=
 =?utf-8?B?U3E1QVBpNldqRUxRWVdOZTdqT3cvODJwbWVEU3lScEprOTYwaUpOak9WQ0d2?=
 =?utf-8?B?bVhLRlBlRmZueVozdjFZM3RNQTlOd1Avd3RYUW9OWjdOQnFuSmlGaS9EMXRt?=
 =?utf-8?B?Y2JSaFQyVkZUYlowUTR4M1NFeHhTS1V4R3VKOWdkRHgyOFlVazFvNWRQNDc0?=
 =?utf-8?B?d2NQRm1RelVGMTdVMElnTm0zQ0orK3NCWGViM09PRVRPR0VqOEl4WHpBT0lL?=
 =?utf-8?B?ODFkWkF0QnlabnlsY0szZUIxa29nUWVVaGIwYWFmdzByWjhseEZXZ0V0dDlB?=
 =?utf-8?B?VWExRGdIL1MzelJGdW1YdmNtT2tpWEFzaUtCRi8xSWhsN0pSSnJIb3U3ZEk4?=
 =?utf-8?B?bDh1WFVURllyeWk3WklRVHdQY1VOL2NsbUpkWHZhNGlFSE1FZitEUkJqZmZo?=
 =?utf-8?B?ME9XVVdCa3A3YWhlU2lrN1dFZXJSeEpnNHRhc2YxWlZkOHQ4Tys0OWttd3lq?=
 =?utf-8?B?WGtIRTBKTDJiY3BxanZ2cW96Z0Q2bkFIbitId1JOenFhdXdjU0RTbkFJc2xV?=
 =?utf-8?B?NDQ3bjg3dDhwbWhSUmNtOFA1MXpPNnAwTGhabDRvdHZJL291RGhHSXNwbDh6?=
 =?utf-8?B?NGtYZU95engwWU9rZnpzVjlvT0ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kz52gn3YQeOj0HlIY67nGKH0zgkiZ6mFuWOZLCrLwJmoKXTGzBnoEUkiut1k0lPSt5RhM1TPokKjQ9c9O5MkIv0Jja9kSD58OYcyeP3z4VZVHLu7WzJRcFNlSwzImvVCZ4xXo4ZQrXXkCGPPn4ZIlDlOKDQfxftCeqKxwFCrKZGrWEBdNdo7kOMf7J+5NNyfgFFsVztl5dkO1WdcZRr/d1ezbVok6y9ZI34RVqm/3/QeuPE9gGbIgSAJZBAKHVLMrlzSyzGF9XBzkEDdXuRbFKeL2HgIKmI+3eTfPW9ZO3e6+fGdWM9qz8vO7ceyLKprPW1+t2FbZgcYLyxEcnVeqtSaqZrgPZdpao8JgOgU7SUHDlS4Jwl9dTLfhhyp1y+kYSl9dUrx0KGhdlbgF/diFBldYDVaqPf2SleNk21YcRvyKOE/ITOnXTGj3hYhjztF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:55.0830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b582dd4-fc98-44fe-83d0-08de62631086
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5593
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfXzU0cqVqnXvxe
 N3P7ykY10Yxwnh2r9eg0r3pSyYosqXudcOXCokCiElbhge+lfhBi4ukkhgb3NQgctT8ctKljtkD
 OT4jZ0ci/QO5OJ8UaOu3AMKiCFvDY9zeKSB9mYIAIGfK7RuAlT2NZdTcTm2Z25RPleIqzE2VVJj
 PxOm5yRTgMcuddExYzrMBWfL1sQ5sKVksnsNRsLFb8jONssbYlfsEbYhMgIJ1xUlGWVXp8klo21
 YLmFmCIxS+/NMwqIyjqwzhqFzpACNhNfR3i2I1pKUhlkM0yoVoJusLrlGQiS54dCEtaRbegmNx+
 NB230q1rtIblqIODb02Cnnza3cIuSD3kiOVMXkMS8Z00cbZgla3AXhzVlkFmujEC9SoC05o0PxU
 oDxBYJGQ5cLA5VaPu39eIPj53J/7P5rV6QvVGE2lyihkf6CGAz5eyEc0+CsHnN2AUV2iOl1p5Am
 OMPoNthoQZ757wn1s5g==
X-Authority-Analysis: v=2.4 cv=ILwPywvG c=1 sm=1 tr=0 ts=6980ad69 cx=c_pps
 a=896zWVB3lkap0gFnCg6oog==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GFosw7tHZT6EbzkxW0YA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: NP5-ck1UpfT4XBS0HrBf56tHIO8-RS6-
X-Proofpoint-ORIG-GUID: NP5-ck1UpfT4XBS0HrBf56tHIO8-RS6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52019-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A9F1CD096
X-Rspamd-Action: no action

Add topology of the two pixel pipes (main & aux) of the stm32mp25.
Do not make the link from dcmipp_input immutable and enabled by
default since not all pipes are always used together so when a pipeline
is not being used its link should be disconnected to allow proper
pipeline check.
Not doing this would most probably lead to pipeline start failure due
to incompatible pads configurations on the unused pipe.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index a52b3b0e3c37..44440f8ea9f5 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -75,6 +75,11 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
+#define	ID_MAIN_ISP 3
+#define	ID_MAIN_POSTPROC 4
+#define	ID_MAIN_CAPTURE	5
+#define	ID_AUX_POSTPROC 6
+#define	ID_AUX_CAPTURE 7
 static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	{
 		.name = "dcmipp_input",
@@ -91,13 +96,46 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 		.init = dcmipp_capture_ent_init,
 		.release = dcmipp_capture_ent_release,
 	},
+	{
+		.name = "dcmipp_main_isp",
+		.init = dcmipp_isp_ent_init,
+		.release = dcmipp_isp_ent_release,
+	},
+	{
+		.name = "dcmipp_main_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_main_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
 };
 
 static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
-	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
-			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, 0),
 	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	2, ID_MAIN_ISP,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	1, ID_MAIN_POSTPROC,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	2, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_POSTPROC,	1, ID_MAIN_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	3, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_AUX_POSTPROC,	1, ID_AUX_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
 #define DCMIPP_STM32MP25_VERR  0x30

-- 
2.34.1


