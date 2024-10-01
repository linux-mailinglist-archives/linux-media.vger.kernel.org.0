Return-Path: <linux-media+bounces-18902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB798B798
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 10:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8581F25A51
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E58619D069;
	Tue,  1 Oct 2024 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJoy1ZZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EC18D65A;
	Tue,  1 Oct 2024 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772689; cv=fail; b=LRPJhhfXdLN2mJ1zwXfmMZGlzZw18GSc4Wf/Vd8dQ1bU34MqpMZKdo7+WlMTpd3gsDHcK04Q51XWJqhbUE5lnV2sY63MaXJTak7Nw9nAVzmQ2AhpC2YY2+r5Uzs03bVx9H35OTEjontxWcb6oTua3OAZimR+yhYMt3HjejIq9Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772689; c=relaxed/simple;
	bh=1naVQxisiGXnfNu4B8BFk4UorwmlKK6DYzKfElg8aHI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=okIwpx8UNmwQDn2L4CA4XCZJUcvdTCe/wrESyesmBkVOF39tM2CxOyHhXIISwDlsfFQTPGSgmY3axW0R+XPoIm8MxaPHqXC28eTH25haMLSzOMN3TeqKCd6WqZgSt5Mz0jfJyPJwrHe1O/3jqPMx6qs20V/9dgyBMD068Udeia8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJoy1ZZQ; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4911InnF015604;
	Tue, 1 Oct 2024 08:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1naVQxisiGXnfNu4B8BFk4UorwmlKK6DYzKfElg8aHI=; b=UJoy1ZZQBGmvB/3Z
	F3MwTj3+otftOteZQl5LWh/YlbCi1h2yhT3I4YkX5DeURGQh2XwK7e0D7kFDn17E
	f0XRb3gSNnO8FockmqS+nG3VwQ+BLUmgRpEG76mFPdi+cBnoZacZVy2YXH59ARTQ
	Dd7czvjTrwc5t/Gy2gKAjGJHbbA3sbGKhT/9Lu4R2ai3rqDnDGClNFdFEK3xLQ2+
	2sfQNp/iTCvDCByYGB9by294uKZCHjRX8D2bFV+l9rzDEYIl48XXdLIRuDPo+T9/
	pDfydUcBKu/dJm7cg3lRBaA4AT2VPNNDY4JeVZeNtngrMyB7WBFdXUiu98i24T3b
	A9L1MA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010003.outbound.protection.outlook.com [40.93.12.3])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94hfmkq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 08:51:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzTp66g5sYZqiv+EL8J+xUAznVliMWZkgGRA2pFSuAvK/L13n0nYkfwatvHxXdVEk61G8/qTzth3oj6rWMZ5uVQ9lTyGH8NOC4Z7bs5gyRDM54SN9+9K+sbqRgDHLflBxPtkd/xscAJtQ2NZi95aEPEgiJ9D13SFors91fIY54jPNCONSX69mW86mFK+fY1YhadfnNO/RojpFJLgm45Mw6dmpQVUW7nbZ8u2ttU4XT3Cj46RPONLEPvX8+bgkg0Xw31UuKg3DdItiWP/pdTnl+XDU0hoDaYI+Fb8BD2newUbCKe5gbH1+IcWnHa0qJi6y3bCT7NihwZiL+Sp9DAD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1naVQxisiGXnfNu4B8BFk4UorwmlKK6DYzKfElg8aHI=;
 b=dEQ5wAMBuA69u2g3b15VNPu/W3pCXdYY22DsvNFesai5NIw5lEZ7U6S8iEip3/LfHNSzfdajMAB0tRVSmxpfFknxcI9nQuJf+IkyWmiBUGecS9J1n2OpFIR5+Mk5lFddV6jhi+kJsXyRa4d0DfHWLAPD+WPMqc0XyQHpIGUJLRWcO2GfUbWDLH2sZPS7s68BYaROQUOekp55yS1A2c4wjCwmU3WYsj6b4W7wb5gn/R2/gDVyz4oPt7EdGaMxCYUWLss+0uBoruSZJaN+O2Uz64WkrUHBeHex+Ue28BWZgfTONQx7/RHAe7n1bU56VKnAr1KUBVyAIr7elpvXnf9QgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7853.namprd02.prod.outlook.com (2603:10b6:a03:32e::8)
 by PH0PR02MB8745.namprd02.prod.outlook.com (2603:10b6:510:4b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 08:51:12 +0000
Received: from SJ0PR02MB7853.namprd02.prod.outlook.com
 ([fe80::c21f:4b97:1075:fffb]) by SJ0PR02MB7853.namprd02.prod.outlook.com
 ([fe80::c21f:4b97:1075:fffb%5]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 08:51:11 +0000
From: Vikram Sharma <vikramsa@qti.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        "Vikram Sharma (QUIC)"
	<quic_vikramsa@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Azam Sadiq Pasha Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Suresh Vankadara (QUIC)"
	<quic_svankada@quicinc.com>,
        "Trishansh Bhardwaj (QUIC)"
	<quic_tbhardwa@quicinc.com>,
        "stable@vger.kernel.org"
	<stable@vger.kernel.org>,
        "Hariram Purushothaman (QUIC)"
	<quic_hariramp@quicinc.com>
Subject: RE: [PATCH 00/10] (no cover subject)
Thread-Topic: [PATCH 00/10] (no cover subject)
Thread-Index: AQHa/rs6MCvY0sJY50OyYUi3wcQihbJwUCkAgAARQACAAVe/gIAABznQ
Date: Tue, 1 Oct 2024 08:51:11 +0000
Message-ID:
 <SJ0PR02MB7853C8C151DF8BA6A855B4B9EA772@SJ0PR02MB7853.namprd02.prod.outlook.com>
References:
 <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com>
 <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>
 <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
In-Reply-To: <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7853:EE_|PH0PR02MB8745:EE_
x-ms-office365-filtering-correlation-id: 798dd25a-d410-4377-5994-08dce1f63325
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlJXeFpPYVFpVXVVSDQrYWMrbUpHdjZQMlpZR2g1Y3hmOGxvdmswMFpsNDNL?=
 =?utf-8?B?VGNUdElnOW1yWC9CSmlIN2xrcmF4VjUrWW92UDNvamo3ZTRLdXpUbEpZdHJT?=
 =?utf-8?B?QU9DWEY0bGd3QnZSU2dhcmxRVmtUU1ptcmVFeWp5ZmxQc0RaMkFTVkpvMXQr?=
 =?utf-8?B?YTdIWnlqZHlIK3BpeWdUUGl2L1MyTlVPSDJhRHFpQ1NjajZxSDJDT05ZbjFv?=
 =?utf-8?B?dlU1bHJpeXUyR3hHOWU1dW9CdllhRDczcTkzM0pHbEt2aFp6L1Z1VW9oZDlI?=
 =?utf-8?B?RW1oQkJyS0dYMVE5TmthYzZWOXJ2bCtPQjNBTHpCdmFMMkZ5T2pnSXJ5RlJz?=
 =?utf-8?B?dE9YTDlEYWExV3dRZFhhdjltUVFkL2dQdDYwMS9jb2Y2R0ZsazVvYUZab0pz?=
 =?utf-8?B?a3dWV3MvWUpjWm92ZzRuQ080NVdnUVB0cVErN2cxNjRyeEd2S1B4RVBucjJj?=
 =?utf-8?B?MGtPSTYrVndlYVJSYTlKeUhGcWx3ckNGOHJnbHNXRlZpR0pCWmMrSXo4Qlow?=
 =?utf-8?B?M2ltbkwzV3FvSXNvaGZnOWN5YXQ4dWpHNkc5NXM4QXNtQUNpNXp1TEd2cUNN?=
 =?utf-8?B?Y0luK1dzemsrWUU5SGROVkxCU2pVM0VjMFNCa1g5YTlXUjVpbzk4K1Y0NkZZ?=
 =?utf-8?B?djQ1ZWNhTHVVdDE4Y2lFa2o2ZDZod2dsQWIyTjBVZFIvejJyeEJYSWV4VG1w?=
 =?utf-8?B?QVZwRUp5RExML0M1QWhHWmUzakNtTWdDc01ZdUlKLzg3dHR5cGNqTDhGNE5t?=
 =?utf-8?B?ZTJVbVR5bURzajRIL3JpRWljODlXM0ErdndxVUswWGo2aElBdXRaOEQ3ekFa?=
 =?utf-8?B?ek9BdlJmaDFtZjE2NXdwUU50RnAwSGpwYWJocFJIVWovbnBPQjJXZU0rdDFx?=
 =?utf-8?B?WlVCQWhTNlZmSFdzeWlkRUhCSlBkWEtxZjNrVjVIR1FMRlhwTm5KR3lUVzc0?=
 =?utf-8?B?emxyeldJRkJodVhFa0NadUNBdVZCYWF3V3RVZmFPdGdzeWN2ZnNYZlpnY28r?=
 =?utf-8?B?bUh3N2hFVHpYSlFWQnYwWThIbVlQcjFqTWlxYUVueTljUVhxRDBSWDMvajVa?=
 =?utf-8?B?RkxOT1JnZVFjSTd1TWVOL2JmRkE0U3M2akhaNGcvRnpseEZuOC9hd2ljTGxT?=
 =?utf-8?B?V3VNdm9JbzQ0M2JHcElaYnkrQUlKRzZrV213UW9TcCtEWXpTakowbkpJYTBU?=
 =?utf-8?B?alNwUUE2NENXUENVc0laUGpqOFR4Z012UlBCaGt0eUczNXQ4V3dIUG5XQ016?=
 =?utf-8?B?TzBpQ1VIeklqaU5XUnQ3b2JjUnFJUFFpZUQ3TWZXUE5GYW8xa1pTSGlIRSs1?=
 =?utf-8?B?N0hJNWNOUHJZMnIwVDJ4enlnNjluSUozOTRCNTJIeDRuTHA0QkVMZjJSTVhS?=
 =?utf-8?B?Y1doQkZSeTdjMDlSNnVCbFo2WC8rMXFteFNiZEJKT0IvSUxDcGhtVDBKdjJ0?=
 =?utf-8?B?VUxyYkhMOTZaVG55cjAwNGppYiswYTdTZGJWbkZib0Vza1Z5WFlMYU55cFcw?=
 =?utf-8?B?R2Q5YSt3QXZOUkd4N1VBQjNFUG1ac05HWGRHZmdYWU5jSTFOZ2VYNE9DNDly?=
 =?utf-8?B?Ympsam1xa3RZZ1czRHAyZGlhMDZmQ3kyNHFpYXJXdW1qTG5VV3IxUFEwaXBP?=
 =?utf-8?B?c3FYTjVsRzZGKzduUXRvbTVGdUNaTkpta1NQTFFxc3BKRm02ZE1NdWxPUHNw?=
 =?utf-8?B?SnVveGhyR2lzcUM5RWJiU0I0WVQ3YjRiM3Rjdy93ZTRFbVlBWXB0ZER5THBp?=
 =?utf-8?B?d2dURXFKNldNdFNsY1RrN2VxVWcvakUrR3A0MlBjeUFVOE1xblVhS3NFN2J1?=
 =?utf-8?B?NzRya3lvM25ZY3ljSTh5b2VLTW1lMTZ2VWRndXllaWkxRkI2Y2lxVmIwdGZS?=
 =?utf-8?B?TVV0SGNlMXZjM0E0Y3NrdVM2OHIxcDhJbzFiR0k5MWpHTS9tbUtvR0dORkFQ?=
 =?utf-8?Q?eldtyo8GXsQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB7853.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXJNd2JyRUI5Y09mbENtMDl3dnY1ZlkycG9VeFNvL2ZwNTNnZjBNSjU5czI4?=
 =?utf-8?B?T1I3WkxrZGd4TzBHRk9MRzYybGtUajlxQXV2N3N3ZlZOZkJOYUpUWmFOaGdv?=
 =?utf-8?B?YlRJNG5yR045Z0pYL2d6OHEyRzJJZi9yemM4WjBSaWtQbkZxTGxBZDl6WUxm?=
 =?utf-8?B?VG9mTURndHZBVWY1MG9SUFVDNXNQN1lFN3EzbTFpTnBwbXcxMHdCMXhKZ05T?=
 =?utf-8?B?NlFsbEZ3Y1d1dWNhM0hMcHFtNEtYVDNaY1I4c1V3ejNtcHJzUTVIMnVmeUNt?=
 =?utf-8?B?V0MrS0pUaDBDTGgydTJJczVJSkJwd25QdEZVc3lNdGk2bllmWk9sVlh5eGNS?=
 =?utf-8?B?WmlBN0kzTTlZUzJRWFFDV3h1QzdkY2crQmM0UEFZZmtSNkRZNURxbVFySDlK?=
 =?utf-8?B?U0xKaTFrUzhWQ2FaQ1p0OEdNenQzY2piMlJKcmhIUHhXeEFZNG4waGo3Uy9i?=
 =?utf-8?B?dU1ZUU0zZHVTLytJOEJneHczL0FteTFUeWZ1N0JyNEt3eWxUOWhFMy9ReTZq?=
 =?utf-8?B?NC8yeVlFSC9waTZIRVdYSEZxbko1SVM5eVRoNGs4MVNZcG40akNxenF0TWVN?=
 =?utf-8?B?b09obW1iRjZYVFFrSW1uR2UwMUwyd0tZbUc3QjNaRnQwOGhWNlBTL0pjSXBK?=
 =?utf-8?B?bEkwZUxDKzVWOHZDMWdKV0s5NTZFeVAzVFVLVXU2MVcxT2pwbnIrTTlaVVFC?=
 =?utf-8?B?QU1TWVhxQmYvUFVyNmN6ME9CdE9EaW1PbGlCK0UrVy9wR1VsNkZGUlRWRjFn?=
 =?utf-8?B?ckxhaDhXd25NVlVnS0dOaTNqUXRtSFB6eFpTKzBRM0p2a045T0hQQ3pkR3NG?=
 =?utf-8?B?MUdxZUpIczFFanBpbTl4TW1nUTdnRzBtMGJscHVPYzFqTm9KWjlieDVxeTF5?=
 =?utf-8?B?YytWRjNkMDZRcmZsOWtqdGg0SmhuWERVQUxRbnVndTVTSk0vSEQ5bERicUhN?=
 =?utf-8?B?NXVCbXI3WjJHMk9uZjZDZnNodHR4SHRocHNLQVRGQmFuem53b0VlWDQ0QXdQ?=
 =?utf-8?B?NUhNcXhJcUdqQ0h5UGR5M0FCN1lNamo0NHVGaWhJdVpsNitJdVpBOTA5M1N3?=
 =?utf-8?B?amE5NXB0byszQldxaTZ4RXkvWWNuMnNIZmQ4OUdjc3RsekF4YnZJaStsWGFD?=
 =?utf-8?B?bmdqRlpSU29NQW13YWpuTi84U0IwN2sxWkJFMmlhZXBOZXR2ZVAxVE1zbWVw?=
 =?utf-8?B?M3Vpc0dLQ0R5b2xSdVFaa0dYMG90U1hNR2VEeWFNbVN3U1dqV3FwZUs4UklL?=
 =?utf-8?B?L3BlanhNdXVJYmwvZVBKZW5BckhNbzM1MkU1K2xmNUVoc3ZqWXJwRTg0MkJw?=
 =?utf-8?B?ZnJMS21RMlM5MG5FQlZSNHR5L1prQ3lPTmJHVTIvMlR6U1BvZ202UHllM0Z2?=
 =?utf-8?B?aWZGQ2M3RkJOd3gyVjdPT2VqNW81VmE4TitkSVNsYkFkeVVDbUIzS0dJV0o3?=
 =?utf-8?B?TUpsaHRFdXFWcjMycSswV3l5d2VyS2I2dVRaandvT0VYcjFwUCtBK1lmelFQ?=
 =?utf-8?B?YldYaitpZlhTeW9OUEpYajB0ZDFTMXN0ZXFVVUpZMTVnV1NGRnQ2dW50YWRJ?=
 =?utf-8?B?ZlMwTnZEaUdKOW9NNm9aWUw5R2tsVEJIeStMZnpSbEw0dUliSFJWOWI2WUpo?=
 =?utf-8?B?ck02M2hIWG1iUGMwc0lPZVFBTzgrM2xCeHNGRkwwMzVDeloyMHZpWUhmM2Vp?=
 =?utf-8?B?bVdKNERrK2lGSzlacEJoVTRjZTcyaHRqeTNlMzFrcTNyM1d1Y01Bd29BYmto?=
 =?utf-8?B?RlBCWU1SRHFFKzE4NTZBM1NtY0tobjQrU1JSaTMrZnA5M0E5d0tKL2M4aXBs?=
 =?utf-8?B?WUxtenZUWEJOUFJJb1cyVUpsc1lDTndPcGs4Zm95OUFDcUpPaUMzRjlGZVlu?=
 =?utf-8?B?b0dnZVR2dzFpV1pIOFBtYzVrSmtSeGJYMVFQdlRoRVpmdzV6ajV5czFhcFM4?=
 =?utf-8?B?dGFTejVuSkVPc2xoUEZvSUdpaE1PMHhOMTF1bURYVkpTaFZQamVJZjR5b0xz?=
 =?utf-8?B?RW9LQUVvbWFpRmt0WFV5UXdhaEFkeUtYNWZUTjM1NzVTS0U4Yy9KWHZyUXY2?=
 =?utf-8?B?U05IY3pNUi9hWFYxalBiQnFZS1VGQ2V5anV2eGRodmlmRGVnWElscWcvMmpV?=
 =?utf-8?B?Q05wdnNyVHhibk4xdjFJb1RpaUZJM3R3djF5UHdFSGFxbmo3WVliY2dlZTA5?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xHT02lptNMyy+E3mTaV/ZHHQboJRbaCAwV0+oYCn5SDdX2PNr+spt/lwyxKbs06yrq+8UVXIA+lt5pAxuex7MsexcWyURJTvx9g0Z1EIpfwcJh9TEJpcAp49kct80bbo3CpX3npq2zwJKqsmdSIaaQ3lQ8J89suO5KTZk5P5JCGSWVZDE8/Dq5S9f7py8scxd6HBDLDiHM0+1D2q1ET5F5H3CDKz6DnZmSJFskEFU5elr3ao7fSW+OHwBuWNp1z3ovoWjew3uAlW6v4wsJcpuv7WiFVlSOy4ID+Vfuk920E05UsnsZr1bVA6Tj2pM4jiobL3fwcUG6worcO0GU1zxIjGQyF+WRUij31/6RpeHqdqMgBxoniIzXkagMB2KY/Lz+B2BdThrPpr//bzFcdFg113cMtkh4ROJBdeR4wcnl6xA+8/R7cK6RYwyz9/3F3rZ1qgwQ9+h+BF+Endr1NdOHcax2wcZkQ/JZ/P1gVmg1GUGq7oHYhKoqEWmT1YXHXS6ltAfs4BrxjNdgn32D0xmZW53eZoR7+8/97cEaSeKVvBzwGzOHmUDovabC3Z9SKoR8QnYeQw0YTUcuBeZ1N0Xno8ovkcSSTRry5oR/uUbJgIO/a9l7Ztptvfo1B/YHy3
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7853.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798dd25a-d410-4377-5994-08dce1f63325
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 08:51:11.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkIBHD4MNkW1WDc8zWNDQS3yVQJVgZoNdZzExLTXJgiIUkkLMXZJwllKqAh6mINqp2Okpmud/iMF3l+7GCGGySiID4edPojZTVPhu9V4b1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8745
X-Proofpoint-GUID: r10TCG6r3DIqDD9Xs9NCJEWJiu9nZjWY
X-Proofpoint-ORIG-GUID: r10TCG6r3DIqDD9Xs9NCJEWJiu9nZjWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010057

PiBPbiBNb24gU2VwIDMwLCAyMDI0IGF0IDE6NTQgUE0gQ0VTVCwgQnJ5YW4gTydEb25vZ2h1ZSB3
cm90ZToNCj4+PiBPbiAzMC8wOS8yMDI0IDExOjUyLCAgV2Vpc3Mgd3JvdGU6DQo+PiA+IE9uIFdl
ZCBTZXAgNCwgMjAyNCBhdCAxOjEwIFBNIENFU1QsIFZpa3JhbSBTaGFybWEgd3JvdGU6DQo+PiA+
PiBTQzcyODAgaXMgYSBRdWFsY29tbSBTb0MuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBi
cmluZyB1cCB0aGUgDQo+PiA+PiBDU0lQSFksIENTSUQsIFZGRS9SREkgaW50ZXJmYWNlcyBpbiBT
QzcyODAuDQo+PiA+Pg0KPj4gPj4gU0M3MjgwIHByb3ZpZGVzDQo+PiA+Pg0KPj4gPj4gLSAzIHgg
VkZFLCAzIFJESSBwZXIgVkZFDQo+PiA+PiAtIDIgeCBWRkUgTGl0ZSwgNCBSREkgcGVyIFZGRQ0K
Pj4gPj4gLSAzIHggQ1NJRA0KPj4gPj4gLSAyIHggQ1NJRCBMaXRlDQo+PiA+PiAtIDUgeCBDU0kg
UEhZDQo+PiA+DQo+PiA+IEhpIFZpa3JhbSwNCj4+ID4NCj4+ID4gSSB0cmllZCB0aGlzIG9uIG15
IFFDTTY0OTAgRmFpcnBob25lIDUgc21hcnRwaG9uZS4NCj4+ID4NCj4+ID4gVW5mb3J0dW5hdGVs
eSBJIGNvdWxkbid0IGdldCBlLmcuIENTSUQgdGVzdCBwYXR0ZXJuIG91dCBvZiBjYW1zcy4gDQo+
PiA+IEkndmUgdGVzdGVkIHRoaXMgcGF0Y2hzZXQgb24gdjYuMTEuDQo+PiA+DQo+PiA+IFRoZXNl
IGNvbW1hbmRzIGRpZCB3b3JrIG9uIGFuIG9sZGVyIHNjNzI4MCBjYW1zcyBwYXRjaHNldCAod2hp
Y2ggd2FzIA0KPj4gPiBuZXZlciBzZW50IHRvIHRoZSBsaXN0cykuIENhbiB5b3UgcGxlYXNlIHRh
a2UgYSBsb29rPw0KPj4gPg0KPj4gPiB2NGwyLWN0bCAtZCAvZGV2L3Y0bC1zdWJkZXY1IC1jIHRl
c3RfcGF0dGVybj0xIG1lZGlhLWN0bCAtZCANCj4+ID4gL2Rldi9tZWRpYTAgLWwgJyJtc21fY3Np
ZDAiOjEtPiJtc21fdmZlMF9yZGkwIjowWzFdJw0KPj4gPiBtZWRpYS1jdGwgLWQgL2Rldi9tZWRp
YTAgLVYgJyJtc21fY3NpZDAiOjFbZm10OlVZVlk4XzJYOC8xOTIweDEwODAgZmllbGQ6bm9uZV0s
Im1zbV92ZmUwX3JkaTAiOjBbZm10OlVZVlk4XzJYOC8xOTIweDEwODAgZmllbGQ6bm9uZV0nDQo+
PiA+IGdzdC1sYXVuY2gtMS4wIHY0bDJzcmMgZGV2aWNlPS9kZXYvdmlkZW8wIG51bS1idWZmZXJz
PTEgISANCj4+ID4gJ3ZpZGVvL3gtcmF3LGZvcm1hdD1VWVZZLHdpZHRoPTE5MjAsaGVpZ2h0PTEw
ODAnICEganBlZ2VuYyAhIA0KPj4gPiBmaWxlc2luayBsb2NhdGlvbj1pbWFnZTAxLmpwZw0KPj4N
Cj4+IEhlcmUncyB3aGF0IEkgaGF2ZSBmb3IgcmI1DQo+Pg0KPj4gIyBDU0lEMCBUUEcgUkI1DQo+
PiBtZWRpYS1jdGwgLS1yZXNldA0KPj4geWF2dGEgLS1uby1xdWVyeSAtdyAnMHgwMDlmMDkwMyAy
JyAvZGV2L3Y0bC1zdWJkZXY2IHlhdnRhIC0tbGlzdCANCj4+IC9kZXYvdjRsLXN1YmRldjYgbWVk
aWEtY3RsIC1WICcibXNtX2NzaWQwIjowW2ZtdDpTUkdHQjEwLzQwNTZ4MzA0MF0nDQo+PiBtZWRp
YS1jdGwgLVYgJyJtc21fdmZlMF9yZGkwIjowW2ZtdDpTUkdHQjEwLzQwNTZ4MzA0MF0nDQo+PiBt
ZWRpYS1jdGwgLWwgJyJtc21fY3NpZDAiOjEtPiJtc21fdmZlMF9yZGkwIjowWzFdJw0KPj4gbWVk
aWEtY3RsIC1kIC9kZXYvbWVkaWEwIC1wDQo+Pg0KPj4gTWF5YmUgb24gRlA1IC4uLg0KPj4NCj4+
IG1lZGlhLWN0bCAtLXJlc2V0DQo+PiB5YXZ0YSAtLW5vLXF1ZXJ5IC13ICcweDAwOWYwOTAzIDIn
IC9kZXYvdjRsLXN1YmRldjUgeWF2dGEgLS1saXN0IA0KPj4gL2Rldi92NGwtc3ViZGV2NSBtZWRp
YS1jdGwgLVYgJyJtc21fY3NpZDAiOjBbZm10OlNSR0dCMTAvNDA1NngzMDQwXScNCj4+IG1lZGlh
LWN0bCAtViAnIm1zbV92ZmUwX3JkaTAiOjBbZm10OlNSR0dCMTAvNDA1NngzMDQwXScNCj4+IG1l
ZGlhLWN0bCAtbCAnIm1zbV9jc2lkMCI6MS0+Im1zbV92ZmUwX3JkaTAiOjBbMV0nDQo+PiBtZWRp
YS1jdGwgLWQgL2Rldi9tZWRpYTAgLXANCg0KPkhpIEJyeWFuIQ0KPg0KPlRoZXNlIGNvbW1hbmRz
IGFyZSB0byBzZXQgdXAgdGhlIHBpcGVsaW5lLCBhbmQgd2hhdCB0aGVuIHRvIGdyYWIgYW4gaW1h
Z2UgZnJvbSBpdD8NCj4NCj5JIHRyaWVkIHRoaXMsIGJ1dCBpdCBhbHNvIGp1c3QgaGFuZ3M6DQo+
DQo+JCB5YXZ0YSAtQiBjYXB0dXJlLW1wbGFuZSAtLWNhcHR1cmU9MyAtbiAzIC1mIFNSR0dCMTBQ
IC1zIDQwNTZ4MzA0MCAvZGV2L3ZpZGVvMCAtLWZpbGU9Zm9vLSMuYmluIERldmljZSAvZGV2L3Zp
ZGVvMCBvcGVuZWQuDQo+RGV2aWNlIGBRdWFsY29tbSBDYW1lcmEgU3Vic3lzdGVtJyBvbiBgcGxh
dGZvcm06YWNiMzAwMC5jYW1zcycgKGRyaXZlciAncWNvbS1jYW1zcycpIHN1cHBvcnRzIHZpZGVv
LCBjYXB0dXJlLCB3aXRoIG1wbGFuZXMuDQo+VmlkZW8gZm9ybWF0IHNldDogU1JHR0IxMFAgKDQx
NDE1MjcwKSA0MDU2eDMwNDAgZmllbGQgbm9uZSwgMSBwbGFuZXM6DQo+ICogU3RyaWRlIDUwNzIs
IGJ1ZmZlciBzaXplIDE1NDE4ODgwDQo+VmlkZW8gZm9ybWF0OiBTUkdHQjEwUCAoNDE0MTUyNzAp
IDQwNTZ4MzA0MCBmaWVsZCBub25lLCAxIHBsYW5lczoNCj4gKiBTdHJpZGUgNTA3MiwgYnVmZmVy
IHNpemUgMTU0MTg4ODANCj4zIGJ1ZmZlcnMgcmVxdWVzdGVkLg0KPmxlbmd0aDogMSBvZmZzZXQ6
IDMzMjY1MTkxNzYgdGltZXN0YW1wIHR5cGUvc291cmNlOiBtb25vL0VvRiBCdWZmZXIgMC8wIG1h
cHBlZCBhdCBhZGRyZXNzIDB4ZmZmZmEwYzAwMDAwLg0KPmxlbmd0aDogMSBvZmZzZXQ6IDMzMjY1
MTkxNzYgdGltZXN0YW1wIHR5cGUvc291cmNlOiBtb25vL0VvRiBCdWZmZXIgMS8wIG1hcHBlZCBh
dCBhZGRyZXNzIDB4ZmZmZjlmYzA4MDAwLg0KPmxlbmd0aDogMSBvZmZzZXQ6IDMzMjY1MTkxNzYg
dGltZXN0YW1wIHR5cGUvc291cmNlOiBtb25vL0VvRiBCdWZmZXIgMi8wIG1hcHBlZCBhdCBhZGRy
ZXNzIDB4ZmZmZjllYzEwMDAwLg0KPg0KPlJlZ2FyZHMNCj5MdWNhDQoNCkhpIEx1Y2EsDQoNCldl
IHdpbGwgdHJ5IHRvIHJlcHJvZHVjZSB0aGlzIGludGVybmFsbHkgYW5kIGdldCBiYWNrLg0KDQpU
aGFua3MsDQpWaWtyYW0NCg==

