Return-Path: <linux-media+bounces-38222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0138B0E63A
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69E491CC1234
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DE0287257;
	Tue, 22 Jul 2025 22:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W/6gDz3j"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A322E371F
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222403; cv=fail; b=uyf7a1z+27OV7xTVm1r7zzmTIBGsGwC0AtWWWBjyFai7t0lfo5iY3btAOFksRyG6LSuZjpAu/WEJGLSVQstqUOhUCO+KBlLdU/Stxn8BWmE8Prr92m2i3N3NVy809APh3iAuQ3V9VGPXJTufXJbS/tPYHn9i/NPXztNgwR5HgO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222403; c=relaxed/simple;
	bh=2ZnS1s2Sp8DT7LWctB3r0xqKWHErvBuOJ2HvIA8c2bY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ai43pLXYJVtSxj5e60YPwUgiLQcgP91oq0/uJpEPzBotDwxvlHwCUNnBRJ/FYSUTBKspQjpfsbjq2QDR4thsQhKSVrUcRP/UCxdZmRLDLIMHWda5kavCa+HXtQJ7iTls95nWJ75D6XHoQuZ6NET3lf6fe181LV2SWLNrxSt1ejA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W/6gDz3j; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU43A09uV2yf++dcnGal10nuxUPnHlIjXP/VUbC36lxrMYvlci0IR4vsUJufyMEFw8DojTVFjdYD8zQImF1gBb8fgN+ZbVERSRD2BRj0byvvJ4Ia/Pf1vaPsSLjzx/GmQAClyaCI9MO5XulV6i9BR404jadt1Q6mqSOxo3MRPAiYJFj9DcRUOwYEi3hhH1eROLbw8Y9QvGlh9UM5NMEpdwgGwb11bzDdps2Ndj2oiHg/uFghurSISjvA8v+kTEDfy4iaIWfAlM81ZapQEAtDX7vSAf46YFWaFdORN4/3lheQNXBUxkfKo59+udnX86rVG6aCL4brPtZ/C5DXl9foXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzQ3UwazyXDcQVOJVLAoevNR4mWx8w+CDioRk7AqAxw=;
 b=QdW8Tj1ydjb8gSsFF997kRU2Ue2hkSs7H3f20X7pSWsbBJw/At6up7kxIuNpPwRffVfa2n0zBDDSAqtAqAw+uDq40K5TZOdWHfGeHES94h6paHGH9LSG43XYgab2wc9NrglaxVn1aURFzhDrR2GC/gUNgdCA//i8zSB4rrlsFJGh3ZXGHBeljbRhd7q8oXVBYYjM3BUk21nVMTsQ0BV7On52tvN9eJnkW5p+e1zdp24Nl2L0IYLGB9uo1lwkNhnwib7e3ZPiFdNrHoCPoCiR9M1en1LVNskzdy/G82rt84wnjWDWDBXfGrbZXzLI81yrmCyWZh94le1/ZLbDqvN1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzQ3UwazyXDcQVOJVLAoevNR4mWx8w+CDioRk7AqAxw=;
 b=W/6gDz3j5j0m/7xaBipihq9KVygA3kPIENVvZFDhymP8MwljzQaBxkAbqES+pe9DbLWUys40OTWKXSmWPhlq3kF7r7ykegtXsFYjdDYi4YLt0RAL6hYTFClPXGMWq7JQa/c1CY5PrQAqTwhkIO0ctxL1KetIwoj/DX92upgVjVGU2bpH7pdfCVu0RXxuuVLtfQoy7biLnYgkQjGX5AjP9NPhqdNt+G2x1zOx7Yqlj5fMo3tsvVhm4fNWEji50x1fLJ1avcBcmkWdWsfSZiHV74+m1V0nd7Db0nsRkK/KJqIMkF9N1vl0gykJ1jmHZ/k4SyQ7UTIniZrlhEFEm331yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:13:17 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 22:13:17 +0000
Message-ID: <da4b6b32-0108-4877-aa66-c202739430ab@nxp.com>
Date: Wed, 23 Jul 2025 01:13:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/64] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::43) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: e981a3de-0b07-48ab-3cf6-08ddc96cf59f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?N0R0cVBpQitrZHZici9PQUYyeWFnR2NXeFRtdk8xcC9YaFRFVFVPekJnRUpQ?=
 =?utf-8?B?NjlpQWhMSUVza0c1ai9sMndZcFBLK1hnZzRJWTRiUjA3TDI2NFNPVmhjSG1h?=
 =?utf-8?B?dVA0M1FOcTg0RGowQXA1bXhkNDlaM2pDSDl4TDM3L0VqNmpWYVUrQ0JoSnVT?=
 =?utf-8?B?VG5LSy9FTitsSmdxSEYrUWladkROYkFHOVdnZSs2R0hrMWN6a1ZHcHBFS3RH?=
 =?utf-8?B?cXpyem9lWXNaWGZZZ0NVWkQ1NjM4QlpWc3NsNHdxU1o4amQzOFBZTlllamt5?=
 =?utf-8?B?dkNZdzB5UVVjRzI3Z1FGb3NxQmRSeUhDdWtKM2xxa0tmMDlrREt3amFlRTNj?=
 =?utf-8?B?by9wZW1wY2N4MndYRVhENXN3b2pVa3hEdy9yVUl2WVdkUG5WcGVBb3pnUTh2?=
 =?utf-8?B?c0NyR1pHa2xaVEFPL2RBUjN3MFNhb0J6RmtLZE9LbHNRbjErYnVqTWVkYlp2?=
 =?utf-8?B?Ky9XaVE5QUVNNVVyTXpuT1ZCMzIxTUw1L0hWNE10MUt2WHJlS041YWl3cnNj?=
 =?utf-8?B?aFdOZnVIQnFUTzVYdlIxYitqOUJSMCtDSkkzR3FGc3NzSmFsNEFBQklWL3Nn?=
 =?utf-8?B?MFRBYmcxRWJ4OGJScVhTWTBpWElKNkIvRFEzQ3dDT2pCalU4WmNEVlpyemJP?=
 =?utf-8?B?OEdNSFVIUk5od0hSQURNeW9zRlZXdjMrditmR1ZIakNwMFV3aUtOcVlvczhT?=
 =?utf-8?B?RlJ0bVNYb2NEYjhrYzQ2VHYzUmtwUkU3TFN3eklQTUpiTyt3U3pjcVFoaGJZ?=
 =?utf-8?B?K1J1LzR5Y3JIZFovNzVtSlh6bE5PT3piODQxdUdPVld3bklPeVV2R2hPSjdQ?=
 =?utf-8?B?b0MrK2xKTjg0VTNYSHovUHNBSm9kZ3MyZXpySmx6YldTUzlUWXVjL1k0ZlJt?=
 =?utf-8?B?VDNOeFhpYjZDa0dyemZRbnpQZzBycnFOSXdMVmx0c2JHaC91ZC9PN2pBQ2hP?=
 =?utf-8?B?a0NwUVFueDFUYi9RTGxEY1c5SVF1dGZjeUY5UFdnODRpMlZIRExqNThmVWdl?=
 =?utf-8?B?ZWo1cDdXL3JtbC9TeGVwclM3NjN5Rmx1RWU3NFhOeTc2R1ZNZHFCa1J5cnVj?=
 =?utf-8?B?TENtZGZmNUpUSGRjSlUxcWJ5eTNtTWJUU0dqSi9YTzZGR0lSdHhKK3M5d3Z1?=
 =?utf-8?B?aGJsZGFVUG1XbEM2aXFMY1N4eWNEYi9oSnpieTJxMm54Nzl2OTZnckE2T0pq?=
 =?utf-8?B?TkdMVTRoamhZR3YzaklLOG5vaGZhMCtveWd1YytmOGQ0aDc0L2NJZkU4VzE4?=
 =?utf-8?B?SU9lMTlsZmNOV0UyZkxRR3oraldkd01udTB3dHJDd21SNjYxYWV1ZEc5U0R1?=
 =?utf-8?B?aGRENHBlM29vcEhLbjZjVHNJM0dGUjh5bUR6K1kyaFluanZtMURpL1o1ejI5?=
 =?utf-8?B?TXc3andwS3dOUmJNZHljcDJxelNCQUNkT2Z3cHRKNnlFSmlmVGRTTnlzelhP?=
 =?utf-8?B?LzlPTjgxT2VUdGg5YTdseXNWSk5BbnlNU0lEU050WTB3YnBQVDdhbHpDOXpC?=
 =?utf-8?B?SHJSOW5pYWhJVU9KVE9ObUxiaDZTMmN6VDdjWXVIbEdEWUJGZDRPSlFBWEZj?=
 =?utf-8?B?RVVDc2tYSEUrTzRtNklJTGxGNUQ4dmhmcTdGMGZ6dWs5THc2WkhkajBDMWxU?=
 =?utf-8?B?Z0orM3BnajNZQm1mNmtPUHpjOEx2MlRmZE5UcFhYemVLejNHU2ZYRjI5aXB6?=
 =?utf-8?B?ZkhBZ0IzMFBjNENhYm0zdnlKejZpWmlDTEdYcjdKWnNMNmRnNkpFQ3hLRS9B?=
 =?utf-8?B?YmJFUjAvVmkyV0owbmlnQzR2N01vYkovNjAvU1VDRTNlNVhGQzhQVXR3Rk1L?=
 =?utf-8?B?UzgvaWZTQTlSRTdyTnA0MDdxUXd0TWdBUExPZXBwRlVoZUZRc0ZMK0RMTlo5?=
 =?utf-8?B?WFBGZEkySmE4ZUJwV1FLOFRhVnI2TndQUTBIdFM4N0sxdXVVWTRCZFpqdmkv?=
 =?utf-8?B?ZkxlejBlNnQxd2ZnblRhS2tiaDlPL3prVHREK3hMLyt5dDZiVHpMVjVEdi82?=
 =?utf-8?B?NkZ1R0RCbjBnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aDlvakd1UTZMUE1ySkFxZzJnTkVlaFRjN2wxNE9lRlJUeks0OWs4RDZ4R1dZ?=
 =?utf-8?B?YWhLblF2TVVzcGtCQVhzeVlWY0p1MDE0SzdaMk91Z0NVWExYN0pHN2NmekUw?=
 =?utf-8?B?SHZnUlRkVHcvTyt5N2lmY2oxMW5wYTRyVkt2UkpydGcwamxYMVgxaVNTSDBx?=
 =?utf-8?B?aHhsOSt5UkpVZVlhRmpZSVVyRjkyUmxOSW1vUHV6ZE9RVkN3VU9vOE5FQmRR?=
 =?utf-8?B?QkZ1bXhaY0dGR1VWV0ZiQ09UZGtyNHNDZ0xxNDhGbUdFdWlNSU5pbEJWQ3h3?=
 =?utf-8?B?eXliYUpKamVIeXVkaU1rMnM0ZnlXd3dKSXRlYlBseHFBQWRWcTRmRHhWWC9q?=
 =?utf-8?B?WkVWdjV5ZnJKMzNPcnEwZVR2OG43VmY1RGovNTZ2NzczWlczMEYxRkl4VzRZ?=
 =?utf-8?B?eTMzdUoySUp3bXQyWnBCOUR2TmF5b2U2OU0yYzkzUUlGR0N2OGFzU0pDMndE?=
 =?utf-8?B?bUxuWDZrWVVvcmppR3ZLajB4SkpzTG5udHpnQ01UcHl3SXhjSHE0d0lKem9o?=
 =?utf-8?B?SGdteTlKUUtraTNpcFRQZXlyTmJIRCtIek1FR2NDMWhDd0MwNmxQVFErcmVN?=
 =?utf-8?B?cTNrS2tGMVFLZTJudlFCc25ENnFxQ205bXVHYUExdnFmYzBIcnlDT2RrdTd2?=
 =?utf-8?B?emk2bnhGZHNtdm1zSFp6U2YvOWtYZUpIdktvMnJFQ3BWMnR0aHB3SDMrTXNj?=
 =?utf-8?B?aE5mMFR1dVRobVNxbFVGa0lEYjhqY2NMQTFKRzE4S1ZXT0Zud1c2SFFrMVZZ?=
 =?utf-8?B?TjVxR21XZ2NYeHhvOVVDdnVkUVVERVBJeDFjaHdHS3lHc3VCMGVjTjFxY0h5?=
 =?utf-8?B?bDAwU1czWUVhSitpT2NIckZOWTAxK09heWt4L2pnc0pNOHhtUUNseW40d3Az?=
 =?utf-8?B?Nk1nL2RuWUFRQm10aTJIN3RWYjBxN3ppK3dibS9ZSGpLK0VuYlN4UlcySVZ0?=
 =?utf-8?B?bHBUQnBwaUhHY0UrdTBpSzNwZmhDMXJWZGpjT1VnaEE3TUUxRXc2bWMyYVRm?=
 =?utf-8?B?aG9uKzRLaFNOWG9RVFBmbXN4OGFoSkZhYXNVZjFIKzl4TEExK1FkVHZzSk0z?=
 =?utf-8?B?K3ZhbGRscVRNTEVjcXBsT0NHckxNU3g0V2dlNXMvQTlpUnM4TE5Rb3dLbkNX?=
 =?utf-8?B?ODhTRWpieS9peVhzSVEwUllXZlJvMVNhZkRsbkV0UzNIVU9qZi9YQmhManFK?=
 =?utf-8?B?cVRPRGdiQkR0MnZnQXlDU0Y4Zi9iOUxZc2lOelY4VmtPQmpoTW43aHA5cnk0?=
 =?utf-8?B?ZEd3Si92ZkMyR0VGTmlNOThIMzN1OThtSkNqU2pGT0xXaVdPT29iaGhwR1dz?=
 =?utf-8?B?NlBoaDNIYjFhQndYc3c3SW43MGdPSjl4em82T1N2d0h2V2I2RW1JM2VBOHh5?=
 =?utf-8?B?SWVRRDMxbG15akxoSllMSG1UZWFEaUlUQkk4bWNOQU93OTBidG1COGN4azhz?=
 =?utf-8?B?MkEzeEtVeEJUMjNIck52ZmVlTXpYSHJLODhqZTc5bkFNbU1iaExiQkZFQ29N?=
 =?utf-8?B?dlBDazd2U3h4VGYzakNiYm1pb3dTQkxrVkVncXorSk9aOStYSldaZjJnV3BR?=
 =?utf-8?B?UHM0QVlFeThpcERpeFAvSUlNZ1BkRkpyNHNXQ1ZTY3VoYythdmdTdVZsdm4z?=
 =?utf-8?B?Y2lZRjBhanNuWDlhV0o3eTJrUmlPdzJDVmo0L3FOZHJxWWF6eVFzS0w2RVZV?=
 =?utf-8?B?MTZ4N2xaV0dGdVh3elBGSVJUOTlCcDNLSHNsSzVRcHJUNEhKckx3Zmc2YWRE?=
 =?utf-8?B?Y2hHaWZrUzFMRi93eGdoajVqSlpMZEx1eU5qVDZlK3VzVHBNVnRmUkQ2dFVq?=
 =?utf-8?B?cnM2Y3BLTXBXL29SbEQ0Q0VzRW5YdkJkWjY3NUNQSU5wRzJ0Y1U5TWY0Y1gr?=
 =?utf-8?B?ZjZyVHhkTjRQZU0vYTVLczhLam9oZEhiUFU1NW5jQ2Vsak5jY3graS9Lc0tq?=
 =?utf-8?B?alJJRHhvUFFUbHhoS09IcDBJK2U0K0tkem5EVU9NaStoSkkybFFiUmlDTkdt?=
 =?utf-8?B?bzF6akExTWoydkE4NjBKNTRDL1BTNFNTVDFzZHJFcTJFd0hkdSt2ZFRVamlr?=
 =?utf-8?B?a09jVW41U2tUU1RidlE0RDV0aEtjVFdUL2NFTlZLQ2NLZ0NDNE42MnRJdmRW?=
 =?utf-8?Q?Rn8JwbqXhwIfpEGilZzzzDUV7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e981a3de-0b07-48ab-3cf6-08ddc96cf59f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:13:17.2588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZszwaBl6q2V94AQuSki7ZJ6AxzxRWuxTUyYRfkkcpV5uSTB7f2OaSSu2AzE/B8cMbxHgs4rRYaQHgRIsm62GUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> pattern.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
>   .../media/v4l/subdev-formats.rst              |  2 +
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>   include/uapi/linux/v4l2-controls.h            |  6 +++
>   4 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..b19aaaffbce0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -92,3 +92,42 @@ Image Source Control IDs
>       representing a gain of exactly 1.0. For example, if this default value
>       is reported as being (say) 128, then a value of 192 would represent
>       a gain of exactly 1.5.
> +
> +``V4L2_CID_COLOR_PATTERN (integer)``
> +    This control determines the color components and native pixel order in the
> +    sensor's CFA (Color Filter Array) when used in conjunction with
> +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> +    order is constant for a given device, it is not affected by cropping or
> +    flipping.
> +
> +    This control may only be used on V4L2 sub-devices.
> +
> +    This is a read-only control.
> +
> +    Available patterns:
> +
> +.. flat-table:: V4L2 color patterns
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 2 1
> +
> +    * - Macro name
> +      - Synopsis
> +      - Value
> +    * - V4L2_COLOR_PATTERN_GRBG
> +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> +        blue, green pixels.
> +      - 0
> +    * - V4L2_COLOR_PATTERN_RGGB
> +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> +        green, blue pixels.
> +      - 1
> +    * - V4L2_COLOR_PATTERN_BGGR
> +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> +        green, red pixels.
> +      - 2
> +    * - V4L2_COLOR_PATTERN_GBRG
> +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> +        red, green pixels.

This table with the pattern definitions is not on your metadata branch, 
but it is here, so, ok.
Hopefully, we will add more patterns in the future, as needed.

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>


> +      - 3
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c06d8c83e2b8..d6d0e9a0eee1 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
> 
>       \endgroup
> 
> +.. _v4l2-mbus-pixelcode-generic-raw:
> +
>   Generic raw formats on serial interfaces
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index dd5f06546773..8119012c2638 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>          case V4L2_CID_TEST_PATTERN_BLUE:        return "Blue Pixel Value";
>          case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
>          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
> +       case V4L2_CID_COLOR_PATTERN:            return "Color Pattern";
> 
>          /* Image processing controls */
>          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c3e6a49b2549..09e5d5bbe7f8 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1221,6 +1221,12 @@ enum v4l2_jpeg_chroma_subsampling {
>   #define V4L2_CID_UNIT_CELL_SIZE                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>   #define V4L2_CID_NOTIFY_GAINS                  (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> 
> +#define V4L2_CID_COLOR_PATTERN                 (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_COLOR_PATTERN_GRBG                        0U
> +#define V4L2_COLOR_PATTERN_RGGB                        1U
> +#define V4L2_COLOR_PATTERN_BGGR                        2U
> +#define V4L2_COLOR_PATTERN_GBRG                        3U
> +
> 
>   /* Image processing controls */
> 
> --
> 2.39.5
> 


