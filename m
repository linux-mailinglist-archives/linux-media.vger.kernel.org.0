Return-Path: <linux-media+bounces-56173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP4aEnk1ummzSwIAu9opvQ
	(envelope-from <linux-media+bounces-56173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 06:17:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB182B5E16
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 06:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86FEF303A873
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 05:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5AE35BDBA;
	Wed, 18 Mar 2026 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="EqB3308D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D621771B;
	Wed, 18 Mar 2026 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773811054; cv=fail; b=FYG5dOfqkkGlAu4tQcd4Z4A0VVGwI/3U0vV4aSp7ekOThcsDTSrZPNYWc06EqExNceQdVewVRVYnV0z/ZFrCigs7lmau0Rzevnld3zrCM8DnYjUS//GhJqk3CjvshE5waTJNx0O4lLGAINASAhGl5U9lRTqn9wXQxkS6QvGQwYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773811054; c=relaxed/simple;
	bh=hQ2P40ZhHEh5Er31zpmRRTL0lOwwO1nZLrHGiLemne4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=F3Jo/k5DJXEOU+eCsKzqzwXx6mvTkCXoWlF33V/OZkM9jFRTU/cQr3CeI1cldwMFxrqMPnh1JiLEKY4mM43jt8Y7+hWXPHMuekZtkn/cizSzvdEPLiPPTQpu199OyDPF/N/EoCEvkrLlhaM7f1TFqc3xeg17IEZTczhqZIRTNaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=EqB3308D; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4KUkc3773143;
	Tue, 17 Mar 2026 22:16:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=j08MtRc+l
	WRNnlOzXKS/G9AHv3zFM000rK/noomytFg=; b=EqB3308DKXA6silmeF3HClT4R
	8yT4R7hE49OdeKGTOnGcFL6fWYUpWKt7itxzRLT9iH112L0onZJYugPx/VSxooOR
	HWMVk6aw1OPyhIZcpdfto2GaRxehF17NmDvs/X2ZPtxo5/gwUaF0WVlGOGi97x/g
	LgKmHmcuykgFNua8rusb1kyS+USSS+Zvha+zjx9dCNI4i265z97mwEuNSkk1DZEV
	ECrqcKLa8JEUhEBR/Og00PfyGKs0ur/+laE9dP3grydi9fAVE8Q7gIyDymDFjHCB
	zqHhVWA9MnCYiHFL0yanY9z8YC0LGn5XqKKT4Gbioiud0zcY+tAWmqnbwS4pA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013047.outbound.protection.outlook.com [40.93.196.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dv3rp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 22:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ8I2WgGCFZ59THdGqKcSjoMwVgxFdxL4oyYeoZKFEW08tdai48QghG55HbVHaYjm+yERPbELs+9q3PF9XcgvypFS3Iy5sympb0kKhRvc+cEwkslp/NLLy1T/LI4mZqHX0+6TT3/XwVr7zyXufR3nDomu1Uc+RMnVuaqGScw/bbYA2flpB3HKBDCCiub2PFeA1RvAcR2dUKksqy53fFYaNULhNMJjrbQ1VVibHtJFwOFXQUh2aY5vbzLJNfqriAJUzA6d+dDVEp/fnnnOTDjoVjyximifslRgcOh4ux7m7Cg32EqahfzaTFzz19SySNJZK5IFP4xa736JhMBsOdF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j08MtRc+lWRNnlOzXKS/G9AHv3zFM000rK/noomytFg=;
 b=EVY9+cbIILOnOj4Cojp8pqzKpludV0+fnlWYlnq1sLYetF0z/WqejEQLUzFeoqonxgpJpTmKE1ljZj9QufLx/053bSRacWRAFIGK/nlyaPVRX5Q95QRuFe/CsMDDyzBY1KNWBDgunZ6XXqkKNqTykRuARRsMOUFrex8jMrYEkyu1Zjypy0s0EYkayKpPUgNgE1LO8M+2NPCB7Rlib/HbqggLxt+3LW12t7kE4mFzkvF1XUNHPKZaOcPPW4dzbj87Vubcyttkmt+hWdhnXgCJfr+WbBjXFRasi21rLrrb/puXshv26mlS1fT+rWrIsPa3GRX1w06d7uAQYa6iEAZ85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MN2PR11MB4632.namprd11.prod.outlook.com
 (2603:10b6:208:24f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 05:16:41 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9723.008; Wed, 18 Mar 2026
 05:16:41 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov9282: Add test pattern control
Date: Wed, 18 Mar 2026 13:16:18 +0800
Message-ID: <20260318051618.471375-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8ae437-8cea-4d5d-d3fb-08de84ad89f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	3v6xidVpHUo4jG0+NTq2+ivf6OYmIqLurSMBb2l8VdHpWSYynGYxkVH/leOaYGjwfeC/whr0B++CbcIJj4vfsIZtq57Ey6m/+PGBm+0VRzyTPdMhyEKpanefMI/GHZnPCmG1EW9iqmVmDagGNL5RTizTmXJzlt88hSQyxv1gOblWjvW+9lGxRbB8j64py5BmmqUEiQO9ljZqZpl8gZXH1rUnrJYzL1nkgGWhpEjc1OCpdPmpzScm4Fatd3T2Y2VdQWzRdaBU5vX47dRXJpyvdAD82DQ6IymJZBceO/PZh681DwfB8XHVY+Uri1UHugQqYEBg2A4g9u+he565cB4Fdb738wZkn0SStCcb0Ag6OYzbBCkURMFUaLoU5KkCzSnfkytZh0eXq5xMGiSSibtJZCQu+1NX2xD2kCZ5uq7ij/Jd72Pns1pSSKFigulhyPDXb9qF4W8sHMao4RUX30vtpOdBkcnSaAFW2IQUhaBHpVnQ6/RjsXhF7Z0nSosIfDWp4xM+b5vu+PZwaAVKYOFfSoM0PjE5ZPihbX8sJcYsEyMvaVaXnbSOlLh+PWI8ETYGejrEWuxQuiLHSTbA5mup8j4yu2NZUCeTnL8LOW/3yERLUqXEhmJVvxpsFSo5cBflVxv5yZYyLE5VyJY2DEE9KxwXAqUFkooGLanqK0sJlHNEVip53wxjEpBM3sSKP8Q/ZbAH+hCpYNvfVX2dUuanfP6E++a7O7JMwXVxhaxg7XLVEIJrU5hbCRI6CMvolRrL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FM2h7sn5GrAWGSTM2w+RE9e8EuMYd+p/XHZDa53B+PAT1OsHWej1/ixfHChX?=
 =?us-ascii?Q?USHYBxYwxTyKlGYFJwJXseWFalhRpy6rzmxJpjRp66k1oxT5BC6oV+mOcuFa?=
 =?us-ascii?Q?yVE5r8ZZPhvhx3qv1PZB+9TEVSioEibr+hN9A9lf3JMUeqYUVZsyZyNKiBYb?=
 =?us-ascii?Q?DomXRZg2dgKGpwgXWICaWRsA9mmIIkZIJcT5VcYTe9EmCWqUcuDTPWGQW2iY?=
 =?us-ascii?Q?zaItr+jAwtYCo989ZgJ9+YVQ0SLZSnGDtF2xma/5hrcJTtFDbaWwX36OmPi4?=
 =?us-ascii?Q?Xh3KPaxT5LXm4jxc2MAWQx9gnYLrWRraMumtJ1wCust3nMgtCb+JaHNq4Oyb?=
 =?us-ascii?Q?81ne4/b2pkbRyvbn0hG52PwkhYiC23LKw7xJDRq+sNKGXheG/71A+jO1A0rJ?=
 =?us-ascii?Q?cDGdUlGp/kJHWPVcBrZ2L7Raxi3PhpZEG23hDGrZ9riREH1dmfDuH2B1s9Gp?=
 =?us-ascii?Q?up0o/FkOCwqsMN3JFW5AuAKHHjkHPeGE8iCcmNJRvAC/BZ3Zs9VGGIeLBnEU?=
 =?us-ascii?Q?kdqC+cqRiyBVuyofXAJMQ/9FWGxKjwyMdKJdWKay8QyfMjkNqhVLkdQ6cFos?=
 =?us-ascii?Q?qQx2D7eeStm3WpYxd8BM7ulXOLV5RYEL9avQM2+c9ucRXd9AzIK+gpL7uz+m?=
 =?us-ascii?Q?xEmmNa0arlmWio2WGJ4ZCSwo4IwkK/8z1y4xZRPDE4m5Dx7Z8yh+RUXILlnh?=
 =?us-ascii?Q?hz+KO5q/yeccbUA985tEtosXgxm9yysjM9j/ry9ux6LBzp4dfO70VK0uDNHM?=
 =?us-ascii?Q?ICuzUQQecO6okpjcXpAKY+Dh0B8pWHGD3KB2FOzzwY66whCB6SCPPh+isO2P?=
 =?us-ascii?Q?AKfZ4a8duFLhmdZ0eH7FDZdyrzrJUxvfRAXriR746d4gsAnpjmk6f2RPie/d?=
 =?us-ascii?Q?h52+wXckxlo0Gq4XixFzr7ss70lzK9QAMOc9aRUQy+5CiKRHlAkCM+Ji340G?=
 =?us-ascii?Q?DYeinjsETLpyYld0Rwd4NnjfH4WlAWr7WAyp4dhJJBVl0buBZdWKggNJkGNm?=
 =?us-ascii?Q?MsUO2vGjA11Uj5wLZiQLz+a/rtpXMnUtNviNwqpaB9yJVOQJ8ESSP5rBP8pT?=
 =?us-ascii?Q?9kVuVtaOLyAlbzy1Pd/rvg5DzQGVAzq7t8PxjbIP5yNuZIRTMUxdC1aRdklo?=
 =?us-ascii?Q?5vu6q+7HR1GPyKd4md5D7ff5nAhiXlVnoAUHboLM0pySWFgtENIkXluyIv8E?=
 =?us-ascii?Q?lbXm+5AYRLRCfXMWQhSXtBerMT3aKwf8YZ44bXWVOVz/lNMM7TM2rMaVbUSp?=
 =?us-ascii?Q?OXTg2nu7H1+Kiu2o2ti+m38oTtAaEGRyRZclXUKkSWoFGIoCd1/NqNjFVhyT?=
 =?us-ascii?Q?2reoJfyya70RHl35ZxSfmuoYLX5ba1dWOutrtcR+sLpI4yi9T4RRdTZApy5o?=
 =?us-ascii?Q?gdc+Jer59wUd2hZ533p/EF1pcYDPQPpbXbGhuGAO6nakx3nDE3BFBN2Riy57?=
 =?us-ascii?Q?aP8qV4Ved1PJ0Rkfa7EQThDH0IKYgprV3Smro2GoUpnSHpkmBtLt8BO0hhjJ?=
 =?us-ascii?Q?jp5ZBvDgunZ3BJh0RcwphaNNjKnTBZmmKRrCx5HIAch4vDPpPwsXQYClxr40?=
 =?us-ascii?Q?jR9q03XBfKNQ5y0+f4qavudU+5HsjuwIXYZFgXy6bPQO1Hk7BNEwdlhevmJO?=
 =?us-ascii?Q?3N0FMcCPQ41bET1COcyCIdcA7+buFn/TGQ4ABtmBZn+BvIfgsyur0Pt8wK2H?=
 =?us-ascii?Q?SVbVIXln0/WEDe7m8o1FFtVYoyeR3ej4dVAIFOxICIa+ashvLdB+tXe46Ncw?=
 =?us-ascii?Q?Zak/wOOfzeb61Y5DSUlKu6/QwlcVNeE=3D?=
X-Exchange-RoutingPolicyChecked:
	P6nZiXlB46K8mtGAu7sQlycOGTiE36cb/Qk9h/JkCy9S2aJHBqV9B2D+IErq1UxkDa2mlrVnQK6Thv1l0tfVrfsjY5gtNtlXowKzVIXIIo527To3/CMf5lC12Z5M2cH7t8uYYQZoOOqZA89iHncox2lDouSrQ/3MQNqSDcOAsVwb0VRuARrBl6jTMpyo5fF0y2N+hX94j2qeW7cNB0kK9F/vjgLInEbJvLOlUJLTsfWQK7JvpYIGTRnhaGvNr0fvZq7Rl/j8GQTPWe/rhPkIaAqNmU5dRZsDFBYPH1FIDv/js8+PZVjJKmDPHOyBERy+ocSebiDSiG5yBVDN9DjysQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8ae437-8cea-4d5d-d3fb-08de84ad89f8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 05:16:41.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8Y/E4kLH+4DsKdDEcQV8/rvQCf6bvODhZGfB58dcOQ8EFzZsdKZdvic9KvRgKJPnLTtkl2OZAbOudvLh7a5ZFlWhGX5+OQ0wNXfCvbq7KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69ba353c cx=c_pps
 a=AE2032bzocsdReLOztW59A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=q5_IkJXvu-bIt5wfI24A:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0MiBTYWx0ZWRfX5R+1RfS4Udov
 c/fkr44Cc2Xw1bggkDdm+Mx8AtEUT81CelQSp6/wm5qL2VOuzdGw4vuqgZr79bA1zzySo30wUOt
 ii6TwxC8l71a9jWyTGe04oVHuqxjrVZ8hWpw66LejQ35MZtT6Tod6GkYtJHEWtojdEoK7I715l4
 Y2jIxQeEWKEq8rPy9U0/53ien0X9NP7yCagq9T93IEiYYM7Hcjr73XZBcDdVMA/um/V1crAJkf1
 ntbulqUcD1Z8gMRmrNWYvUZuPAjRSnH/qZS7l924WCaKqJo42jKQn4oE9B2uekMHMFbko4Xb8nP
 +HtJ/U7v3bEMchV17ir2kTvJ+dBarBIrmpGgUZygR367wzYQzhmGogu9Iek9Dq1+Wrk5iH1gPPm
 idWZN/8DEl5QJoSDK0+v/1lT1lrp/YtvmDuFooUDr17nMlCos2tLOJ2eGCTWB6ZiRGs5Ee+Qd0e
 VhHyQML5s8LeOVYNCcw==
X-Proofpoint-ORIG-GUID: eZnoOFjgszfwaMASmoJU1uI3hVifEEQ9
X-Proofpoint-GUID: eZnoOFjgszfwaMASmoJU1uI3hVifEEQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180042
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56173-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CB182B5E16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_CID_TEST_PATTERN control with bar and solid white patterns.
Since the OV9282 is a monochrome sensor, white is more useful than
black for solid pattern testing.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

Changes in v2:
 - Rename to "Bar" / "Solid White" since OV9282 is a monochrome
   sensor (Dave)
 - Use cci_write instead of cci_update_bits (Dave)
 - Default solid pattern to white (Dave)
 Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260316090558.1537823-1-xiaolei.wang@windriver.com/

 drivers/media/i2c/ov9282.c | 61 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2167fb73ea41..85f612e7ab28 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -104,6 +104,17 @@
 #define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
+/* Test Pattern registers */
+#define OV9282_REG_TEST_PATTERN_BAR	CCI_REG8(0x5e00)
+#define OV9282_TEST_PATTERN_BAR_EN	BIT(7)
+#define OV9282_REG_TEST_PATTERN_SOLID	CCI_REG8(0x4320)
+#define OV9282_TEST_PATTERN_SOLID_EN	BIT(1)
+#define OV9282_TEST_PATTERN_SOLID_DEFAULT	0x80
+#define OV9282_REG_SOLID_P1		CCI_REG16(0x4322)
+#define OV9282_REG_SOLID_P2		CCI_REG16(0x4324)
+#define OV9282_REG_SOLID_P3		CCI_REG16(0x4328)
+#define OV9282_REG_SOLID_P4		CCI_REG16(0x4326)
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -462,6 +473,18 @@ static const struct ov9282_mode supported_modes[] = {
 	},
 };
 
+enum {
+	OV9282_TEST_PATTERN_DISABLED,
+	OV9282_TEST_PATTERN_BAR,
+	OV9282_TEST_PATTERN_SOLID_WHITE,
+};
+
+static const char * const ov9282_test_pattern_menu[] = {
+	"Disabled",
+	"Bar",
+	"Solid White",
+};
+
 /**
  * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
  * @subdev: pointer to ov9282 V4L2 sub-device
@@ -586,6 +609,32 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
+static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
+{
+	int ret;
+
+	ret = cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
+			pattern == OV9282_TEST_PATTERN_BAR ?
+			OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
+	if (ret)
+		return ret;
+
+	if (pattern == OV9282_TEST_PATTERN_SOLID_WHITE) {
+		/* Set all four pixel values to 0x3ff (white) */
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P1, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P2, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P3, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P4, 0x3ff, &ret);
+		if (ret)
+			return ret;
+	}
+
+	return cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
+			 pattern == OV9282_TEST_PATTERN_SOLID_WHITE ?
+			 OV9282_TEST_PATTERN_SOLID_DEFAULT | OV9282_TEST_PATTERN_SOLID_EN :
+			 OV9282_TEST_PATTERN_SOLID_DEFAULT, NULL);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -662,6 +711,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_DURATION:
 		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
+		break;
+
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1242,7 +1296,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -1314,6 +1368,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
 				  OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
+				     0, 0, ov9282_test_pattern_menu);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
-- 
2.43.0


