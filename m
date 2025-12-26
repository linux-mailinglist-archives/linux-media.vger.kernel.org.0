Return-Path: <linux-media+bounces-49566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45823CDE4DF
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 04:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6A03011751
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 03:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DC01B78F3;
	Fri, 26 Dec 2025 03:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="j8gyM+36"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A64288B1;
	Fri, 26 Dec 2025 03:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720757; cv=fail; b=fPxAqbQGkwzcqJqTdWlL5Pxh0Kp9G0C+cKiOc4k0Rq38pUyP/HxitYf0tdS6bCTcGMY03+t7qKhVYEqGcnJqTPQL5wZinB6QlqDMc1gFRtNs9Uog/Kq4HkctWcQgEhpNR3gaO33Ep3cgInwDqarfV3J9Suw+Owr+09l+bcMvuwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720757; c=relaxed/simple;
	bh=MVFnndvuJIi+6I4yyBRZwH52apTHA8bQCFwgvm3dqgY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A349rbHvwqY9khs2wV+6xJd7AGvWSaYzqy14JCZJYXBbVz4i7VJZkan8Tx5cGTAFy1C3YCv10rYQ7QmRfZaQeiPB47/ESBiJMolvVKgkTHZeaGKbL34JHq7v7i9Cjehrd8kfBv6tqO7s/qSNeF5fphRmohnYIIrCJDiefcmMK8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=j8gyM+36; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ36OnU2181428;
	Thu, 25 Dec 2025 19:13:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=x/yqci9Ns
	+nkNzDcUKIxsAx+siA6eWBrR8qKV4i65ec=; b=j8gyM+36QLJBeERjcAoK9IVMb
	VN6Ik+ATzvzfrH7NiDPp9j84yP5Ix9tfaO0OowsHIwTOzjTDS/az1hFooLO2laYn
	LBoRGpBRMBgxtRrjKNSzp7tlDVI+ArcqrwPvF6I7KRjJ9JFScG1r84nIqOOVKsnN
	vAR/kqdmDK/OtYJrovMvLG02xMwMmngY29UacbgdbUYwVxVRVwXK5xBoWkIKKPAQ
	DlTmFU+yC92RsbGLxcnyuaGLZJzqQ0ohws7f7hmCYPz94XfjbZn9aQzmdvDcC8RP
	xgsX1b2nCsrHppUVVbUZ0pi0zxlCp7ZjPql8skuZnQTAdWpXobPSD/gHRpHLA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4wab3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 19:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX+RfeUl3cZ/BUIZjBSFxdWJfTaeFhU/9/2MD33AFl2qbweMS39XR5hjCCeQmeQpx0mzt+KWtd+CklDVrhG4bWo/xXtd4vf2nJBR2ibm9m1yVtgesBVhUki9v7xtqI9CKDFfmJnYQD/pmiE/XpO1X8CZNGyBgLo/y5NznLqtD/Y+Th6UfGHYO4wGM3uxyyV5EtHI45pO7nWUP14VD5RVC7gEcJpwyB+MxoDfJYDdT23AD70zl7Lw4KIlczcT0w6E4lyJcjE4BRXzbLb2mL3zcF0PT9fSyoNUwakK+DKAQ9n9HZNu332Qh3ZcS2i5MwOMGcFkxnW+rU+41jId+LsewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/yqci9Ns+nkNzDcUKIxsAx+siA6eWBrR8qKV4i65ec=;
 b=soKzL8mN60JyfvaQTS3oUA0uh6bNqxTTvWSp99M9axCz9yEThoSEOfybJ61mgYEuZlbLhJliqEF+wbDynQIRyBIrEnx/h7oEt3tI5EOvdOlRXNQOD1e+v+AX8SegQHHUOatZmnw+IPna6ptWTmfEXIhIwt+l6dRBXYgE1UFMRP9JacpeM/4qd2jJZpDVkTJNuXIAu9mptO2hziVnGKouYa+dJbTKxW3g6B5I9ju9WY2gdu80n0s1TO9gwRG5iYcqIE0KZA0hZHMgZuo33j9ZXx3l/AlZb5oHUQxRTUixxEBK5yL6Y4fZXms+N/8bGA5eiAd4OWgMGBH+2LCiFg9sUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DM6PR11MB4660.namprd11.prod.outlook.com
 (2603:10b6:5:2ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 03:13:49 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.008; Fri, 26 Dec 2025
 03:13:49 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: ov5647: Modernize driver with CCI helpers and sub-device state lock
Date: Fri, 26 Dec 2025 11:13:09 +0800
Message-ID: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7cf16f-30e3-4318-9407-08de442cc9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5bW3Zj8hWlFcu2bwpQf3Ao+PP3eZ5N3ZtNIGoRoXOtPo/SvDoJaIlJADsT6?=
 =?us-ascii?Q?7vbSZWTCzDnj6Niz07gXOavCSOtn5O4KaHS3tY6WLS4HKtJLR4QVonEyb8az?=
 =?us-ascii?Q?40VcefCNQIY8qHVy6Ic0j2mTmFkBi2wyyMfA1fmRFqVRUVYoMSeAFiBXJb0E?=
 =?us-ascii?Q?/4LnnSYChV/NnR93FDCVIcInbG5C91h3tLCjY83a0rLDGbQOI7yyBRqQ7/FG?=
 =?us-ascii?Q?Aj299fBYVp464VU0hQ+r13O/cVYKBqx2jgnx1+Pl6J8Kck8NKyChq37DXiyz?=
 =?us-ascii?Q?bjbJzeFqyccIJ2q+7Kj8kqh5hr4WkjvKO8vqvacdlv7latMhG9HgPQQFwRMy?=
 =?us-ascii?Q?Pw+/pwZPkddiRl5PCbn620f1Yo4c5rUylhbyxPpPtt+marFvHK9wT1+22lgs?=
 =?us-ascii?Q?DECgISi18kLOB9jpzcVybMuY5edxgjagfjk66wURix2KzmRra0kPkxuSSmIw?=
 =?us-ascii?Q?rFPRjMOlEII0tLNAcApJywOIH/0G3C5aEtw6DNy+PsI4Y/DuIZA2nXr2sgaQ?=
 =?us-ascii?Q?HcYQdUyHSRImJxsku0fZ5QqcJfPRttqDYYq7I18hPw+9HfZcWIotwp7Z7N6Q?=
 =?us-ascii?Q?E3XAVHB5UCtMPq8X0ViiUQw3wjoa2GcpM9/6G7hpe35DbJCF4YAq2nBm7jqJ?=
 =?us-ascii?Q?loJASLJUe7rPX3W1gGOh3mUVCjYV4mLEIX4URIthPK9FNmFS8QqDp6KelLYX?=
 =?us-ascii?Q?6NoxHicshuUG6+WhdstZ5DmiGYktgVnYs6Nq2OdE00HAK0NcUXTu6i9YLuVU?=
 =?us-ascii?Q?bI4fT51zSy5412wPGZmV+USzvdfHnPhoautZTtRwIYusRTFp9PbqtU/e87lw?=
 =?us-ascii?Q?nzQ94GgCvqodSuI8KpWp3MPfj4vJHmpGdMiD4awj8sWZnoXNrAek4paQ+JjD?=
 =?us-ascii?Q?q7X79JsXDLMIpRowlEclHUK3Nh93sErLlmB9hfEFknR6CERuUfGRNUgjUXgO?=
 =?us-ascii?Q?cNax897wPAPjNjlr8BTxg3xQs90gJLjYjCXGAlt620FDKaURL5sO0AisbWK+?=
 =?us-ascii?Q?m4QeYD391dd8zeL+9BVPGVX9MMf8x9qtBsye31EKiH5Viiyo9pT3fDqY5+dE?=
 =?us-ascii?Q?hvHOV94EvEynNtoL73L19EMa8Fmr4Ffb+p0LXjcHacVUcismUp/4UeG7iB92?=
 =?us-ascii?Q?/w/KjYyCDPaNeUd4pipx76GDDiKjkW/PbKYocvSx6y8tg0UVjvU9020NhI+M?=
 =?us-ascii?Q?FQ7vcItVfmo/WJ5Fr9JxDuiHhQV7xZRLZcop8bl/a47MmAFHVRbhktGWIunD?=
 =?us-ascii?Q?jvyMqJbEWJJUFIg1z/WkbrcDxvYLO8q89Eu+osmr/ZaQ/lZlffcQpTQR5gA4?=
 =?us-ascii?Q?6s9FuJrq6um1rNb1JCrVYEysQ3ayjn1AJwCLYrSbLMXBGtusnMi0muCupHhf?=
 =?us-ascii?Q?UEkdtAPcoy0D6/atIhmUaxqqHb+np3P0wW052YmyF0oCBzjJ8DKZxOVQBRd7?=
 =?us-ascii?Q?H8dTysCZke1MOOGVvymVDm6futLGfkELrE9Nree1WRDuCtlOxNbRGQntFg0u?=
 =?us-ascii?Q?cDsoqm49oeLJDSHDyaQerzzlHrNUYijiUrw+L2k4c696zmztoVZxnU3Spw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5jD8P4MH00jksrltvk+lAW/54x/vhVLEiJd0rVGvUtwTHEOhAm4WOXAVppEt?=
 =?us-ascii?Q?V1oc/ld8e9uTC6nHQ28Pdfg4ydPyQeICMIQG+eIOhVWrXE5Hf7sGyaXltE24?=
 =?us-ascii?Q?rRfBCekX0K5IYD2yzA/TIjatGP4nNLUvwkDe3HQ8OyqxBHXoxoDmmHTkIQXd?=
 =?us-ascii?Q?cY7bNnv5Y6wRz5PKihPmfXnaxrYWv3Bn3f604wFzftRakNbr7KAYGCtyUQ9H?=
 =?us-ascii?Q?/bdTEsiABD4JOb2IJ5WcdnhH81cz95z67xkdV5gO5pdk6BzgU1ac24GgSv0O?=
 =?us-ascii?Q?ufHncHBd6RQPR7+HvtJYojVQJ6rukz+gyIoqka00NgwNbRtJPvWWf0l7Zy1s?=
 =?us-ascii?Q?5vG0WQKoDnCTVCYMB2hQbmUGJbVMc4grDSb0rP0rOSL2JDa+PT4Rl8aC3kkH?=
 =?us-ascii?Q?d5V/Dj9Smvi68fexW94/rRySDhiHfnQQtWvCT+/ErE81Zn1Av5JPQEOHR47t?=
 =?us-ascii?Q?bg03e4VMXQS4QvYlsjh5qi4kEiQyvCLztWArNm9wXIIw8TAH1c0314GS9djr?=
 =?us-ascii?Q?nqzN0c4Nd1v7MmPwitFTCwSZkkv3k1UPR7OiaFpf5jorVfyte5sfuy1QT+nF?=
 =?us-ascii?Q?XHUpdcxjt/Fmqrs4cp5Z3tpPSyBCiuLvDSKVaIoMLU2zl4TWgFK82zCbMhZk?=
 =?us-ascii?Q?9JmQcEQZoOmx/+iTLo8riLTRkEGFJgcljC5YC+kWw8wJ8WEOERCftQlWNyw8?=
 =?us-ascii?Q?I2GzJyR2JmYW5kCq1bdtLgw08T1WAi6ekb0dwAozGSxYPdfeC/VmByAwkPT4?=
 =?us-ascii?Q?OZe5EVQTlGv5Dm2y03zAgPjt1QBKHErKzxqss/00j12GmZlMrStSVv81eW+d?=
 =?us-ascii?Q?TFJnWNfB/aA4p42wPENH03mdoPILXNK9l4R8BTgq8AJU8rvbreolFgaeelJB?=
 =?us-ascii?Q?wxayOffaW2Q0aqqSYCjNpVWXAI8IEqyR+1d60CmQaCAvc0OdJBvKrSNx/9gn?=
 =?us-ascii?Q?veRTEpAUOmvbKTo91dHuG6FpGW4+Gp/X0rpjIn+APjDZDVpzE9I2+UlA5ZWT?=
 =?us-ascii?Q?UsIrXOb5MQ24L6k7uc9AcfMVAHqLXUN3Uq4SdD90XV4WxY2IYZal3ysgKx0Z?=
 =?us-ascii?Q?+AJgxpuzBhKRsaEeEz7S0RQlWouL7nFYs5mwB3sHwERfpFYlZk59Pf9qfDyy?=
 =?us-ascii?Q?B/yPWJ/OOzzukoFS9JXXqOffnO9r/voMF2lc8IC7FGQMHnHCrowhpxNZENJt?=
 =?us-ascii?Q?ZvUGtdEdv4Yw77p1XP/aek8XRXz/mgtKssGPp7HF+qPUr9smWpZvATEpFBhZ?=
 =?us-ascii?Q?qWTf+U1ZjwDkVq9GTLk1SrfyjTLz1W3KAxEbaPYNnlLPRLqru337n9+nxK6s?=
 =?us-ascii?Q?QW70zONxT3qRLcVdPcAX+Eax+azWviCagdEh0EVfXoHKgHs5GR6RsC+a18Zp?=
 =?us-ascii?Q?j+r1M7KDPvE7kC+2JVBdGKTfUqZIYhwe5Oq/dG4NDV0u9xxgE5PR1WrwC+ci?=
 =?us-ascii?Q?BeJkk0yEed+S01P4CwQd+ukIb3LPditbUEhXSugRX6j2CzNjMCj23u0OdwrJ?=
 =?us-ascii?Q?BwJYiCHneUw0aMx7YLgSZkR57SZf/+ZxnGoRzt3zKLZlpytlxBMXpHsekzQE?=
 =?us-ascii?Q?NYA2A4UUoIWOZQLYvTtn1W4BnG92u5hpy8wj/cNvHodwQLp5v87JyfHci+Vg?=
 =?us-ascii?Q?62H7G/ChtegFyQ3zvcbhqI+1UReJdrh0TzFYAZQoWv6QpDEOj3Sl2I3TzPgH?=
 =?us-ascii?Q?PFouIrwtr4eEd+TjcwnYlL3lcOb3Q8B33LqCHxW8oxeF5L7bDzYv54wG5Au6?=
 =?us-ascii?Q?Yro7wJ1yX64MDoQN9p4NpEza6bU7X4Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7cf16f-30e3-4318-9407-08de442cc9fb
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 03:13:49.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR3urFYKggJkVYK7eTfOgCfxBACfftXlCGVHhJ2AOL6jUVOWXVbTrVkQKsAk4je7rqTFtYOt56o3SSGC89k3WQwg8cEn3DfTr1YORvC5/2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-Proofpoint-GUID: XKSViSY9BOBa2zWW4DOgd2aIR3VdWi_M
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694dfd6f cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=vECI3cdem9Pi_uh8M4gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDAyOSBTYWx0ZWRfXzHoea3K/u+Mx
 5PXkLHoeVkpZVpJloN+EatIUaJ3ghdhGDTCw0YBQtH+QalBrvOIVJz/POfX1NEn7dV3qEXEuJt1
 QGbDi0odeL3QjJ+pcNQfoYuMeln9N/cV5pLaqcj0Qy0rP5M2iVgfTMTYyuC7FmMkYrewh1bUvpH
 UZHldMjhfaK1WODkyAXXr6wwNVekW2T4ORm4JI2NKsWvSm88RMJ8r4D9quvn8ExLk2vsuo7A3Ro
 m8hFMbXwV52hsolhHxsVRbBSE0Zxzrr4MFvw8U7lPRnrv/xiY0ybX3si2OPqjkX44m6aoFvSrhi
 X1VmO/c613FESnrfbackWk79CdNuDKXUMh4s5lP0sUXWTIZc0zpYEJNW8Ik3cCSoQOlg5zHMghG
 TlD6LDhXmcix1j8hFywkz/w+rsKj5PTI2OGS8n/m8cULyuul9MglgkkpcZ3mVNdWKbG70TmwgiE
 REVikiZPlXEIx+fUopA==
X-Proofpoint-ORIG-GUID: XKSViSY9BOBa2zWW4DOgd2aIR3VdWi_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260029

This patch series modernizes the ov5647 camera sensor driver by
adopting the latest V4L2 subsystem best practices and helper functions.

The series consists of two patches:

1. Convert the driver to use the new common CCI (Camera Control Interface)
register access helpers, which standardizes register operations and reduces
code duplication across camera sensor drivers.

2. Switch to using the sub-device state lock mechanism provided by the V4L2
framework, eliminating the need for private mutex management and improving 
integration with the V4L2 subsystem.

These changes improve code maintainability, reduce the driver's footprint,
and align it with current V4L2 subsystem conventions. The functionality
remains unchanged while the code becomes more standardized and easier to
maintain.

It has been tested on a Raspberry Pi 5 and the camera works normally.

Xiaolei Wang (2):
  media: i2c: ov5647: Convert to CCI register access helpers
  media: i2c: ov5647: Switch to using the sub-device state lock

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/ov5647.c | 1004 +++++++++++++++++-------------------
 2 files changed, 468 insertions(+), 537 deletions(-)

-- 
2.43.0


