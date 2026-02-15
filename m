Return-Path: <linux-media+bounces-52825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ce5GjTakWlpnQEAu9opvQ
	(envelope-from <linux-media+bounces-52825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:37:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D724513EDEE
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 282483006F2A
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4875C2D46A1;
	Sun, 15 Feb 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d3LtuGPB"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ECD23D7D4
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166254; cv=fail; b=R9VvVS/wN2kd1stL/ruSja7A6vYTs8STL78KCHZ/QXDsNqHK503ihbctahhCgiNRVMB5Tp48V+c9N3PwcbpCnQYQAv9te8v0NR6XMdPq/L169GmnJBwkIRwqLMZ1JabGeZImiq1q0Piy15fqkN9uP8JHcaYoMb1XD0xmtana33k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166254; c=relaxed/simple;
	bh=jJGWhrKKwZtKu7Y+qm9FV7n08liq8cIt8Ussi3/eaBs=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k5OpXbDgtrEZnuMPvkoJxc8QmdVaRWXzkv8CQMDPM8n3dZSxKXcCtBnCGBTMUmGGe9s7OmSbu1sgSi9slw6Kr/j2JvVacaVZCp/P3NGJwvhRrmrSrrg+GZbbZkTcHSV4MH95EDBuh1RHkc0oBY5bUDWfLbdm2oQqU8E1k6O293Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d3LtuGPB; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkEnDFlVff7qIRLRERuD22vuWhKzSvOw2w48An8FxXun5kh+kT4vsz3KFXJP80+k8muG9dMcv9xcoPtDBx2X+kOCsdyX3O7wfQpAgVGoP9bKQ/Ea9ew3j8oJlsE4zEI0fECiXZv3kFG6UWqXcFxa6OnkSzMl/c771CVNK0ajHNaKoPTC/rUP61ExyzoozNacCmMAr6sBVyh5lwbDK2ncF1UUK6xD8elaToCZuUmDplLNwy2wBemD3Ue9KYAWnneUTUxUV8yr49Uz1fmvBAL6Up10OWSmjMYzMQQN10CKx/KPrXYVgKHmMGQnQltzlo9fm/T30lUMyo42+yyu5DxVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzwSEaFRHVGwFcYmY6THke31ntWCXhYQZjZt9/5Bn5E=;
 b=rN/1U6sKWrK4PvaDM/DASdX/+tKfmmVghAo/8w+T9uQ2EAaG1OelidgQhkxAOUQfUMAWuV/UeXYr28xUOGjSq02FzCm0wpcIwzGZygf9q95ndfQH2DiUQjD8oQ4Jl8E8PlaGrt7jLFpW71kNM2ClkcoC4xNxR2tw+KBaToSr8TR9nnw7h/M5fVq5erRUqypw7BIQWd8jpleTI8E2f4B67weHbQjhEwyRIf/TjFjeR2xgDLJB5CAunYWs7S0jV7a1MIfGepZF1slmDXki65pEZLoZhhTRyJIsq2kWUASuLYgMV3l+fBs9Sh1HZYJXVhgyhZ4T0m/0yR3fQrpCk9tekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzwSEaFRHVGwFcYmY6THke31ntWCXhYQZjZt9/5Bn5E=;
 b=d3LtuGPB+3PUmMzx+ZEdagp1kWfjTFFhaFch8U8bpnPX3bVs8wUK7mXkLpBC2mKFgvklclR9bfsKiG6BzpLAePxJzVRzPF3rSqiXr5Nm248FJAb1JXmDOlp81QuYvHsaB56FrIXoWSGsEdlXNnuQBQAG0tzDOOVcrSQCeBIkLbK3PcrhLcjhq3k2P0qFCxD/+1Wia3Xuu3CiKbAGvRHWeHaT1eeB+93b3X030VcSV62dTAXdV/CX0kiIf7v37ptZNjimS5bwEz/OME9HTKqkcw8Qt56MaBs/aekqB10aWwseAeX0bhoQsJqiXZespySE52IsnL8nhVuFI4ysW2Hu9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 15 Feb
 2026 14:37:26 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Sun, 15 Feb 2026
 14:37:26 +0000
Message-ID: <37eb7fd4-4a1d-493b-ae85-ded0bc6650f9@nxp.com>
Date: Sun, 15 Feb 2026 16:37:22 +0200
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v2 03/14] media: Documentation: Improve LINK_FREQ
 documentation
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-4-sakari.ailus@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260211090920.1851141-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::18) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d271f0c-1872-4c3d-4b9f-08de6c9fbcf1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RVEvYktSUGZRMGVVNDdxYUdENkN5WjJOSzdxTk1yMEluVy9KeWhxWHlRQ2ZW?=
 =?utf-8?B?TERRZWwyVU00cWE3ZVlEOHh5SERoRWlNcGVvVkx3ZWc5a0Y3RlBMU2lyRVNw?=
 =?utf-8?B?TllBSVJtU1IzTDJJRkI4N21pOVJ2N3NsK1R6WVo4ckZ2a3RCbG5HTFFUMHkx?=
 =?utf-8?B?L3dSY2s0bG1reHZ6Nk5LckVKdVNvQnR2eEpaWmZXL2huN0dYM3lxRHdyWThB?=
 =?utf-8?B?MjhZaGJhYk8yYjVCU1FOZHh1SWRGY1lReGxlWjhxVlhRRDI0QUM3bVZKVG92?=
 =?utf-8?B?cHM1SWNkUFVYRTJ0VDd2bXFCazIyZ0E2ZHpUNTlzVVVNSUlvcnVYUE9kVWh1?=
 =?utf-8?B?cHVzR3NFWlZDeXJzbUNod2RaMEdGK2Y2eUtHWmIrM3VJSU1BRUNOZUl2enZO?=
 =?utf-8?B?OHQzWFZMREJwV1JnNlBVSDlFZDJyTVpnZXc2Q1Y4VVplbm1neW1BU01hYmdZ?=
 =?utf-8?B?cnIzMlRxUmRFYWdxY0Q4ZFQxdk95dWdLMTlmdVhaTk0rQmZPOFZYSXk5U0hL?=
 =?utf-8?B?MlpUcTVVRjBmS1lKVW5ESEtFeENCei9hRTJWRkNDb3drbVZiQWVkZ2FuL0x6?=
 =?utf-8?B?Y051NWljUlU4TStXM1ZnUXgvUGFCMjBYTmxscU4zNkJOTytzUVVab1dVQXpu?=
 =?utf-8?B?L3oyMytySXBLcFZMY2FFQmJWaHFIM0cxY3pGQzJTT1d3RTJIR05vSklwUEJX?=
 =?utf-8?B?N0tZMzlMR01yMW5lWElrTnoxMG1GMEFMYTljd0FFNVFFYm1yYm5aMXY5cGRT?=
 =?utf-8?B?c1NMWDZRUEdzRDVWNmNReFZkMDFFS3NsT3dPMVpwQkVFaUlML2VkdXB1bkVF?=
 =?utf-8?B?R2lXSCt3UHNQRC9LdURzUUFNUmZYRWRjQjUrMnZyR2VXN0YxUGRRTGdUMFFE?=
 =?utf-8?B?TG54TFNvc2tBOG84cyt3VElKeWZkK1Q1V1hlbzc5L0ZVYU1VcVlhaHQvWk9G?=
 =?utf-8?B?eURnbk1ydFZYejlSa3NQNVhkQVhWSVBBTnJ6VW1WazlvNXZvOEV6bGdqcko1?=
 =?utf-8?B?VGVoQkhTcU11REpFblZ1cEs4OVdCaUp4SUhBS1N0Z3pUcjBJNkNNS2N1TjI4?=
 =?utf-8?B?ZVZLZWV5SmduT2ZvY0FCTldUTm5uQlJUdEFpS2lLRHQ5TWtoanBRMDhmbTc2?=
 =?utf-8?B?ODJmZmtpelgrTjFSZjNaQ2hDREsrS3N4QXlDZU5KMkQxbVRNdXFSR09qVzdk?=
 =?utf-8?B?Z2lmY2M5VDFLNHpST2FwNDZpSzJNVXNuSy9xNGlpNUNUTzhiNXhuZCtUWUJm?=
 =?utf-8?B?bG9WQjk5Uk4va21LTTBCSTBaTGdYaWZ5c0xEcGk4eHdPMUM5QjJyN1FROUpT?=
 =?utf-8?B?ZWo3ZkFEaFl0UnNaZlI2MTlOUTNZMlNUUWh3WXp5UndoT2hhU0I0aG5sd2NS?=
 =?utf-8?B?SFltZGs5bytsb3F3RGJhMzRRb0pQQ2k0amRuWVROazJzRzNUelRucXM5blUr?=
 =?utf-8?B?bHRLMExJaHp2ZHVubWVxZEZXMVBwYlpoeERSek9sbGFrNUtxYVVQeE5YbkVp?=
 =?utf-8?B?aThWaGhUS25YNFQrSmVjdHRhbStwbXVLZE04RCt0K2NxRWJyMTk1a3locnYv?=
 =?utf-8?B?TWc4ZUg5aFBxM0Z0UDdpa1piWEZ2bFJoM25sQVFjSThkeDREVGpieWtzUHdY?=
 =?utf-8?B?Slp3SVROeU9RUUhsYkwyM0tQK01qME81Q21IOXR1aUJTRGYrSTladjI2enpD?=
 =?utf-8?B?dEh3OWxFOTh4VmlUN2p6Mk5MZFNjMUdHWEhlM09MeUtxT3owRlpsdWw5Yzc3?=
 =?utf-8?B?WHF2MVk1V05DTmhJWUlHYkJ0MlNMS2xiLzdZYWRLL1pvUi8rYk5NaTlUOFd4?=
 =?utf-8?B?MUVxYWc2UE1hbTFnMzNNQlN4UGI1TVNIZHNnbEowZUNwWnNBNXNVRVBIaHYx?=
 =?utf-8?B?c1NFZzJXZlE2UlpZdFFBVXB1R0JJT0xBalAvUHRIem9ZSUJneE5MVDVPRElB?=
 =?utf-8?B?US9ad2RPWEgrV1Z0Z011RmNPVEJ6ejBsYkxjZkRvZHpVd2lUWTBoT0JXWEE5?=
 =?utf-8?B?K0gzTm5Nb1VsdlVsM1ZDd2s2MmZuYnFZNkRsbXJKcms2V2ZGdVQyWHhVcS9Y?=
 =?utf-8?B?SGR4cGp3cFBiWmpTNFVaVXp2U25vWW5DTzZMVllOZUk0OGFXeHpZTlBJWUli?=
 =?utf-8?B?eEJxa3FxRHphSmE5ZHc0cjJHQ2NkNGVxWHU0QVRHWVA2bG93Tzk3TkZRdjhs?=
 =?utf-8?Q?fp71H1AnJjSwbctHtJqRL/8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TlhPM3dZVzA1TzIzclBYZHdFSkRFWEhGOTRvY1Z5TitXYjFpQ05oRGNwcnVQ?=
 =?utf-8?B?NFpCMHZSakFtVk5CYXEyMEFZN1ZFRmNLb20rS2NyeHRrQTVHdy9pNEV3NjFw?=
 =?utf-8?B?MlRUZ2dRRjZab1FCSnpGRTJ0YTk0ZjNhNmtWWUR1cllQb01jY1NJd3R0MTRx?=
 =?utf-8?B?b0lJZUFZTG9KVStmU3JWelcrRWVhY0xuQm5WcDZuTXhOZWMzM3ZYWGpNZmFP?=
 =?utf-8?B?UkFvWlF5N0FabUUwK0hnVGZ1ZkhIQldDbnJqalBPeWNENjE0NnZuZTlRSjZX?=
 =?utf-8?B?YVBkaUdPVG02bm1jNWFVanRDQ2g3NkFqdjZkMks1bDBvWnFBQjlOelNMc3Rq?=
 =?utf-8?B?dHc2QTVSSnZwZUtFM2NBY2JURGZOQkw0MWhZSE1XV3hndkk1S0prSUhrTlQ4?=
 =?utf-8?B?R3hvSjNRVUFteDdzekt1SUJrTjJXS0FVK3BqOHdwYkMyMXo0Vi9DRW9aVk4z?=
 =?utf-8?B?TWV3cXR4ajNnTjNTRGZudUJ4ZmFrQ1pyL1dmWnhCYXJVTUVKZ2pzK2ROZG1Y?=
 =?utf-8?B?bjQ1TGhFdnF2MWJnb0daenM2UHkyT3IzcU9BYk1OZ3lHTlpLNGFKUUVQc0Nj?=
 =?utf-8?B?NE9jem5IUnptcHd6K3RuY1N0ZkVDWlBkVVZQb05qc0lwb3V3TlZFVThhWXFY?=
 =?utf-8?B?ZHpwU1E0SEh6Y0UxVDhPZFluK2U2aklPVUwzdnprRnJVQWNxZzI4ay84aGZ5?=
 =?utf-8?B?bXdmYVJMdGpsMlE0am9yaHdvQno3amxlRzQ5L2ZGbVk4VUhoWmtaQ3p0ZDR3?=
 =?utf-8?B?K0hBanUwc0lvbWxRalEvMEd3RFozQURyVnhHMml0a0NuOGd5bW1kSHN5V05t?=
 =?utf-8?B?NDNrRFd4L1REMk0yNk1CNWJGVkZmYjFKendqa3lrQWo2dExYVm43eVdvazRO?=
 =?utf-8?B?WU94MUNyeld5VURRUUtxdy9CSW0vMDM5MWs5L2EyemJ1aUJVTFcxaW5mcGVV?=
 =?utf-8?B?MUc1amRjSnlQTG0wVk9HL3liKzdibDR3RlFYYzd2VGhrZkQ0bDg0VGFaZGxj?=
 =?utf-8?B?ZkZKVmVaa2J3Y3QwaHJoSkdBRHZRSFRhL0FDTjBEUmgzRERFUzUxNjN2U1R5?=
 =?utf-8?B?NndFc3ZZZlBOd0tiTXJvaTVXM0JaWEQ5bHFacytaU29ZUnV2bGc3Z0ZyeWZ2?=
 =?utf-8?B?Qjh0NTk2K2pHUUFlSzBtOUM3NzY3T2IyelU5QXV5ZmFzdHRWeE1BOTVkUHNJ?=
 =?utf-8?B?M1VJbzVHWmwwWkR5SXJnY0FaMktHN3A2YnVxNWdWbUVENWdEM2dHWmU0K0Vp?=
 =?utf-8?B?ejlKK3pCWWpaYjlUQnFFeHhvQ0RLWE82N0RMMzNBZkVpNThrVXZiYVYzWHRn?=
 =?utf-8?B?QlFsNHRHYXNZRStPMTRsMkhZRjdTbFlDR0ExT3dRTkJGT1lRQnlHT05CUkc2?=
 =?utf-8?B?aUJRbCtOOHNWR25BdlMxNHNzRzVIbmxBM2hLdmpSYUZhMUZVVTdOVktkWnFQ?=
 =?utf-8?B?WHByNm1ZYTR1VEdyME4zem1LMlBLTWV3b29zRVVRVkVGSUFpYmkvMUhWQ0R2?=
 =?utf-8?B?cVhUU0JFaGh6Z3psb0orUDdXU1JCcUw4SThWT0RNQmE1SmZBVkdWQ3NRR1RB?=
 =?utf-8?B?RGIxWE5ycGlSWk1FUDMzRzFvUTlCWUtZb1NoSUp4OFp3S21Yd3JrNTlGemd3?=
 =?utf-8?B?NDk0YkpzZ0ZycHpjWms3SkRscmQ3WVNtSGp3VENFcmpINklIYStzdU1YRDg2?=
 =?utf-8?B?Q29ad0xuMnY2dVRtOVh5VFRqWWlXRHRyQW5ZR1RRV2xsd2phNmZUSGpPVGZX?=
 =?utf-8?B?KzRQeEtQUHR4Y1NNZC94RU1CNFk5aHUvZ1VsQlBMakcxMFNkWGNmeXRlODFV?=
 =?utf-8?B?WlFFR2dtSnZXMko4L2t3bDY2YkxFemNoWTV0WWdGaGdrZlp6eklTbXBQTFpl?=
 =?utf-8?B?elBuWVppSzVzQVBmNmlENThKbFlOWUdwREdJRGVHejEvdWRrYkhxdEZKbmVp?=
 =?utf-8?B?ZENRdVVDbXplVHNJbGRhcU1CY3FvSGVKVmxycGtrL0lQN2tocUpSMTh2ZHZa?=
 =?utf-8?B?WkN4YVd4TDJpdncvbzIxQmwyNWdkdnY5SVl0NFMxQTV6d3d5bXFtcjBPNHFu?=
 =?utf-8?B?UHJMTThEeVhhaGMvWk5EMVFRWk8rT3BLYjZiL2J6aVBZd3drQnhLM0FlYlhN?=
 =?utf-8?B?ZWM3M1orU3lUVTZwMlRhUVZPek1PV3ZDY21YdkJ3VXFFcGZyR2FScUdtWFd2?=
 =?utf-8?B?cHZaRmxHQjk3dklLZFVzOW9jekNkUmJIVFFxTUdiZEw1VGFneEpZejZ0TG5U?=
 =?utf-8?B?b2NXaDVQMS8vaVFiN0lkQjZnVVBHT3NxTUR1ZGNaRnpoUUdpSVdkbWVGa0ZW?=
 =?utf-8?B?ZUMzbnpndlViQ203TEJNRWNmTFAzckg5N2xnQ05DVk9LMjJnanFqQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d271f0c-1872-4c3d-4b9f-08de6c9fbcf1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 14:37:26.0854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suiSV9AAUzPj+XDC7lBbomgkeFeysZgroDfEzZJLObpjOM9Jc5lQ86tOATxTb/bhvd8We+WjD8tW6mAhfoCSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52825-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D724513EDEE
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Add a reference to the LINK_FREQ control and precise the meaning of the

Precise is not a verb, maybe use clarify instead.

Other than that,

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

> control as for C-PHY the matter is less obvious.
>
> Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
> ---
>   Documentation/driver-api/media/tx-rx.rst                      | 3 ++-
>   .../userspace-api/media/v4l/ext-ctrls-image-process.rst       | 4 +++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 22e1b13ecde9..7df2407817b3 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -93,7 +93,8 @@ where
>      * - variable or constant
>        - description
>      * - link_freq
> -     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> +     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
> +       menu item.
>      * - nr_of_lanes
>        - Number of data lanes used on the CSI-2 link.
>      * - 2
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 6d516f041ca2..ee88933256dd 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -24,7 +24,9 @@ Image Process Control IDs
>   .. _v4l2-cid-link-freq:
>
>   ``V4L2_CID_LINK_FREQ (integer menu)``
> -    The frequency of the data bus (e.g. parallel or CSI-2).
> +    The fundamental frequency of the operating symbol rate (serial interfaces
> +    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
> +    Bt.565) of the data interface.
>
>   .. _v4l2-cid-pixel-rate:
>
> --
> 2.47.3
>

