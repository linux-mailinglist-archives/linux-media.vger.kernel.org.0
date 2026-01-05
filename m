Return-Path: <linux-media+bounces-49881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8ECF1D10
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 05:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBA983007202
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 04:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27964324B1C;
	Mon,  5 Jan 2026 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUt+F0Xh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3D21CC51;
	Mon,  5 Jan 2026 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588972; cv=fail; b=oMfrLc0O0yNoosSbEPHHcgtnAnbQv01HyXZaFMcUNPaY65sfpFmRcglbS8ctR08toQLDPGn5KYodywAaJze43CSwapLK2pkjrDtt7PV1RzL/w5phq1FG39lspAi9N6WL44R+KZEB9yLzWz3JG5aBUVFS/VHvmuz+Zaq77++nSxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588972; c=relaxed/simple;
	bh=NA5jLonBYbJ3LLpHSybO4C70NWZT4IAF+/r+WKqdhsk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BqB/S80FhEfg7f+e9tTXLJXO5M/jxO8/g/zoegWk1gmISVm+hBAJDEa/JupcI5Z6JPm+me5Nej+pNE//QI00A+bDtfqHNARXJFiYKIsY3oDp9hJ76lXYKvjgrYm3MDQj0iKSgZWFLGFGP6+soE1oKhzVMbkU9XWKTB3bic6haE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUt+F0Xh; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6052o4S1091242;
	Mon, 5 Jan 2026 04:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NA5jLonBYbJ3LLpHSybO4C70NWZT4IAF+/r+WKqdhsk=; b=cUt+F0XhTcxe+ODX
	Xn6fL1CPlHM87xKl2nvBc1N0fAjRC8kWwK6LWq61QruTbavFWQicDuNZ07FHJlhn
	MQYgkrsGlJCgjCS2ifH8uipDYA6Ff3p5u0sqL/PgPA9SorWkw9QNR0tGp0YX9uUH
	4Mn6fHFZ8VIDv/+EQcSByOffXOyTyU178h1MdmV1AFYONDum9Y0nXxtF0vGwsn0i
	nUfjIPbLRB/tV0B+gFwf/wmtPnUZ0G+Ua6AOQNI8t5Xvd/TGIl59a+jftpzLV4YO
	qrQ3VsU6gyPu47e8WcqWhboIAJ3hCeaFN9WNO5TNyUyxttCHWTcCX4A/EfjIyOUL
	Ji5uLw==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v608dv-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 04:56:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQAhkVC2NhpZxq9Qix94sr+u72kqJ00vvg4KAQoQpKwiLe4W9nN0srxF0xeA7nEVUt2+HcFpAMccudkJ5MXI2bfWr9dynRjT7l0LxvysymiEsmgOqnuGvyQ/SmEpRlrCEjd25N4TvVs+geCemtZLCsyslW3HTtqMxoFLY0TYizQLvMfOMtl72hm0qAGL/vVy+UTz5AgipC1nBnXYN6enZHOvN6+Z7+/qjG9vwFxQBZ2mdqB88w2v9VaVQEeL0eQ8e1U3OY3ycj2mTfajl5wDnDQsJTwctQVPpirF0LDXAuei/gSYWorlWGfeYEGvhan7WXZcp+JhSXOlrNkh5GWoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA5jLonBYbJ3LLpHSybO4C70NWZT4IAF+/r+WKqdhsk=;
 b=XAn/6RiAB+wHTz4tNorQvzT2PnW9hBXy5s5TeODRB1Dney48nVvNFnbJDNAkmSOK+M0BGEtUDzRb9osvqHS9sm4KUQ5wFBzNj1HTsAT+rOVfEMZUstL/rwnBl6nbC/qh3Lvu/3iqytJ1xcZYk09kre0vy6UBvvdcQiOsvNUolwhlm9EiNR+ldq72QDt9wSTqdav+AAy0PxIrS9vNcWL48bqyZri8Q1Wmm+9tLH8K96zr47H83d+w+mMQBwhQ0GrNY0JQZvL4h3++BkxHOp0KU313xaphq3ke8DhLw5Yz6/tIXhYFEkrPrtA6OvKkpr4n/tuoQ81WRv93OHz+0fUntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8489.namprd02.prod.outlook.com (2603:10b6:303:158::17)
 by DM6PR02MB6620.namprd02.prod.outlook.com (2603:10b6:5:222::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 04:55:59 +0000
Received: from CO1PR02MB8489.namprd02.prod.outlook.com
 ([fe80::9832:9604:e07e:7597]) by CO1PR02MB8489.namprd02.prod.outlook.com
 ([fe80::9832:9604:e07e:7597%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 04:55:59 +0000
From: Wenmeng Liu <wenmliu@qti.qualcomm.com>
To: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss
	<rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        "wenmeng.liu@oss.qualcomm.com"
	<wenmeng.liu@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Thread-Topic: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Thread-Index: AQHb8mOBfxzAdMFMQEiiSRVVCEZEzrVEFooF
Date: Mon, 5 Jan 2026 04:55:59 +0000
Message-ID:
 <CO1PR02MB8489192B897BA4677FE5B88E9386A@CO1PR02MB8489.namprd02.prod.outlook.com>
References:
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To:
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8489:EE_|DM6PR02MB6620:EE_
x-ms-office365-filtering-correlation-id: 78c29c04-a122-454c-6347-08de4c16b833
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?4g+YKI+st5EQFdLR83onJCjVGmomZJmkK6bZwSUKg02nAOn9H6Qg1rh0?=
 =?Windows-1252?Q?yuKwsyXvd1RoDqiIjtFeMhs2wnbry/gnnaJBlK8AY311GWcew2nVUcCl?=
 =?Windows-1252?Q?8TLpXRu5coMNdyFFNO/i6Ky+R455alZuhayZObzK5/fTuLkAZ4yd4XQR?=
 =?Windows-1252?Q?C3N1PuDM+al9CcvoF9GJ8CTc0UVhVLoq8rrrDSR1TVrTIkB+rtEja8/h?=
 =?Windows-1252?Q?PESBQT66fGFT9ZfbdEk4csUIKj2UoHu5utJRAJvseAaK1Hkivdhks8tg?=
 =?Windows-1252?Q?1+8UEwMZRD+HaNtQ3u0aBm7ELpPfHyQSOICaxY+CiZ6ApUtVte6WTg3E?=
 =?Windows-1252?Q?Q2AWHvCWj3Ju8j+Oaky5DKHVvGiJL5rI+B7x5+MByEubxO2HP8sUhFLj?=
 =?Windows-1252?Q?JwAyBow5Gq3MRtXiI+fM6heWEi1zsI9WgEt2vOjlckYS8sIFYQO5MA8E?=
 =?Windows-1252?Q?FSVvZIv4+Y5d2+gAL0dOkS/q+pP8czJBeQKarJF6h7QbEhSTCaWpszFk?=
 =?Windows-1252?Q?7Quwp2U111qVkdrBkNhiCbK/P0NfiXlubxm9ysMIZjwH23uJMvtEI4aa?=
 =?Windows-1252?Q?BcxLHuch6wcJQtdttLUs97BboljsbJhNXw2Va0hFy2zpXapgBm20F7LN?=
 =?Windows-1252?Q?zoKFYvhcziz4az7CRQd6YERi+X9oGn/9Vz+nAmndMV96iVSs3kpxI+dM?=
 =?Windows-1252?Q?zGrvfCDR9vfC0SSfipk85PpEDwhBFs8I2CpYSS5Sd1cpL2BOM1VIo1W1?=
 =?Windows-1252?Q?bWUoeP9Z9lic1caXniW5+XsXttKfSpWKqcjgfcYfGIFdkSQwf8haXX8t?=
 =?Windows-1252?Q?4An3+uq57rTlaU9bpr4mkRKcTvxaFngMxf/y+0m6Duz8pcJT4uClNLCe?=
 =?Windows-1252?Q?HY1cBzeocm1q6C9W8MJw0Nldlb7b9FjBQfcdmDcVVVchNBS+0UNhhCDp?=
 =?Windows-1252?Q?Cue4ewuKKHfzLyZiHjWAlVYlWzam0GJpnm4MEzbJ6FJ5ZSqj4h+ifXS6?=
 =?Windows-1252?Q?M9K7opk2cjRcVmhZx8QOYBReiydclvPrp4Y1doSSwGYXe68936iymuIw?=
 =?Windows-1252?Q?9cDdvKcqfzyt/NNTgH6/3dDA4Hfu7kw0jIGC1I46Gp0ejzjel0kwtRn+?=
 =?Windows-1252?Q?zbEoW0amASfnttVN7Ujf1kc6/tNJDooaSaxkANFrJHw3eqEVD6Gxr8ss?=
 =?Windows-1252?Q?tEjD93FEoci8tWuTO1I+Unh/0aZXmq1OyBBh2QDXdYY54IUs3sh4sGF6?=
 =?Windows-1252?Q?T23T30KZANhgK83z7dc43tDD1OHGGdO3H7KOhKkjasyImvIAw2oGs5rs?=
 =?Windows-1252?Q?kgb7pbLFLHs06LLGhgUdCO6S64jZ1O2opSE5udW+Z15hPuB1WC15z8dz?=
 =?Windows-1252?Q?RGvuAz3LbIuJoZ0KX1lS4BGCFIIG+tL/oTMQYdQOsSQkzNydOJuLkqT8?=
 =?Windows-1252?Q?Ak4peh21fMNM3iGxD8LlmCRknAZx/GqP9/O9nZfJiVQ1J9exw11bP8tU?=
 =?Windows-1252?Q?R0wLujKWE6o9X+ByLZWWfxMfsN9go99L4pJg/03Dm5ElVe57NskClbdh?=
 =?Windows-1252?Q?sN8u3JqxOxU9E/pZl2TwVxNSWlMcgU1Ai8mcc4NXh0+JtdNZUC11EXeq?=
 =?Windows-1252?Q?KcFNY98nz08hLQHEZJY486R89oVKvD0VG+hdqo+iPWlFtA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8489.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?5Bgu5RJZhHQKVO+I9gFULVkSiCdRjC7OgdQCDYcLv5AHbWj1/rSfALHN?=
 =?Windows-1252?Q?7ZBM7MjpJcxDKVjnFcDN6yYRw3/4Hztw9G9AxvC1b46cWyY7KDaaWKim?=
 =?Windows-1252?Q?1W2FQ7Ozw60HCZvdmkhxr7ZEEfWBB0cYTRIfBJ36a5inocz73F87VD6H?=
 =?Windows-1252?Q?HzKVDlZudWCw+fAFToz1fTqB1rjVMah17SYp7HK6KchBmKTu9DPddhRT?=
 =?Windows-1252?Q?Rn5DK2YK274M9BPFaEW7E15fvyVW0q/bK8dNwjelU8oa1aowz45HJwFD?=
 =?Windows-1252?Q?g3w+3QQHYzfNiC7CKpuxECET737Uc9RqJoP8+c/jwrDJVqz2El/ntbOh?=
 =?Windows-1252?Q?mWfT09iAUrsCzVhHIZJSp6kwXrgulUu3jZ9BYiqIQjx93nFvk6iZ/z3S?=
 =?Windows-1252?Q?apJ4DezlQk91LLjv+A1ndr4QUAHbRhSzGwyzpz+33X/weXlsgRtqEA/t?=
 =?Windows-1252?Q?8uMoscPIhnfk81MfbYAThWu23Atm7FUFo0o1BLa+yCG6/hA6QND8pld/?=
 =?Windows-1252?Q?mIh72FZiyyiMKH/+6Cg3Vu8l9anxPwNyR56GdCKd3Z9g880ArB8SQyoo?=
 =?Windows-1252?Q?f5+3snrHdXdrdxKb2GOhsQyAjCuPN1mET8JA6oWLY1SeQZSpZ0d4ya19?=
 =?Windows-1252?Q?SCkvERRy1GPestbfC8tbfwS2GuQ/NXtitOMWgRbV6XdVzRVKStftBeKq?=
 =?Windows-1252?Q?PcEZabAcpPJEEcQecDrUJ+OOsT/X2u+0PTD2Y75bYg3oPHxwbVdTf7zk?=
 =?Windows-1252?Q?mGJYgfn9cjl6duxnGghIrzbqjA35lYaVDJajiouDseOxS0LMhcQGjLn0?=
 =?Windows-1252?Q?FE9StdfJwwlw+QD0ePMwsd6osdqt7Ftfpip1Z/MVCzoVu9lAP53faLtL?=
 =?Windows-1252?Q?jtELPV0OkjOlA4RT/kA/g97IFzKrfnsygu5ND5RIAV88DibL0pYRyc4c?=
 =?Windows-1252?Q?tsSo+VrsGQViJ1gC8811Oy1JqXM5hoZYqkgT8+6rYDeeRF3JH8lNun19?=
 =?Windows-1252?Q?RTcevTp8HefWXpETigSqgJtJS0hzjHZqGfiR6shYOXmwo8RdRyVxpyL/?=
 =?Windows-1252?Q?FPtadp8S+HlEMtd9Lu0Ng7ubeK5HSARhxrgD5U4JklzMZ19igJbmIyMx?=
 =?Windows-1252?Q?Mo7lAhkBPbElY8rphVVpuntjhY4/lobyoolSmi1rYp6dz/1vA097G7V0?=
 =?Windows-1252?Q?je5Lu6DLpXm+hpc3Qa9NqBATiVHWWNerZMXTo3OcA1WCUwcWUrQY4zVp?=
 =?Windows-1252?Q?KaPnb5iT8z2YG5D3Ut40BjE2h4vk2hMoMHXK+ZvfiLUqfVy9zOb/7XSJ?=
 =?Windows-1252?Q?rMaWltDMr0Ig+mRzvmN9NWpzkYwnAkktprKwgJcV6u0s26tLAqpL96dX?=
 =?Windows-1252?Q?UrB3/gJUkuNmQJ5/HCeC6AUmuEwODVQPc/8int7xkf2ODa7hvfsrmKT3?=
 =?Windows-1252?Q?6ncg8XU91K1O03ltO/jGAZR4w6vEVz3ugNbbOF+SfnB0XAlitGPnnZL8?=
 =?Windows-1252?Q?ZqPTaJ0rBmBrw1Ulb+/u55vy62+fVOvRwpYTy1L0AQ+/FZkFcP7Ucs7A?=
 =?Windows-1252?Q?261tSWPd0RC0VtRWxk/9vPX48/Fd6ih1n+sYd3ynLB6cTlJX2jBEyp7F?=
 =?Windows-1252?Q?0usD1CFLyi62QdZXiWwGergySSvR1KaHRMd3Nz+eqK+BLi+LQ+zOtOql?=
 =?Windows-1252?Q?0YvucGRTgJmlZAZl8aYYFDXNFyIeuAgRjIiJ43W8PwdUoW3smMmRkGaT?=
 =?Windows-1252?Q?ZMU5N8Kq4fg+DkA64l9siEqj6dkg+rm4q8I6Y7NLPNve3fvuKPlWH9hY?=
 =?Windows-1252?Q?9l0UuLjHgl7X5/h+TuAfIPCezR1DihG81f2DCfMQ9YqOxiUQKm+KqYpj?=
 =?Windows-1252?Q?weX/XcOOqYmY7Q=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T1i0bbz1X/RTza3dPbqXOVEMtk87eLqYp6Aiw3BV6lbiZhEmjbW703zC0rx+Ty0y5P4sXN8smCwG7LYnsiIEelE8e3bCwSww5PR8S72Ggrcqo6k94I0xB1AxLiDW7slfNQS7gjHLnXuShFArU91aps3TolhNRYJKct6FDEeNSQ92OcXA9mPiGW9nPlfd/6/qar1YMTS5LfAUrJrP5XmMDkUfXVTEWIUFvctl2dc+5p6PUWoFuf4twGU78rHQxW2PBSa0gncsLw2CMDoxrqKt66eJ/B/O7Qcr3oC2WzRC0+NkOuVx6op8+iweJXp1Ngc7EMGxHzuIu9yjHIhfkFGC4Y2NE/byioVGJw9s158Tmu19ZsGIcH0W0Sc+4Hx/0yvkPbNd+kajFlt2IwqkhqwUCFAifm3T7j3XRFLYMwaf8WDc+q1kKtplIZEAtX6ZnBbQI1+6NKCJVcK1JGU8/SKRyqjje6xgU+3Hvn3v/Xds9Lq9plGTR4GDQDx4YJwMJEyocfDho6G1zdmV1wOBP6LWmK5bE78kIJRT0K+wAcySnB9bk/4nNjEenUVzLWF/estuzz9ilbXePoEKLMYqAgOgZC5aOr2666C5FbPT8sekKKxMkjxmEs2itF5JwrAdw4xL
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8489.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c29c04-a122-454c-6347-08de4c16b833
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 04:55:59.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVMy9z4rkXMtBaC9JkvqlHZhOcGkbWgVUzSeZ6qbQCbg5gTkrE9+luMD9NsTAtUoo26oowcbeIh8y6U3Yl9jwiv+8SdrxMjsZqt436z7m+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6620
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0MyBTYWx0ZWRfX4xyv12YPgSc1
 I5dR47ZkRi45YSm8NMj6QcBMprKRcyLYxJz6kNnmmlxpETBKphJr49vkEnh4yo5R9HysI8tNSN9
 4dgSAEpu349IhB0Lx8dgdVOamJqxXsK8WdPQf4xVZMUkgN608VVBba4XZ7dJFAXZBSPC2/SihJ1
 Yn+QE59Nlb33hrHJDIGIbqo1yjVCwFtupbYPcDPGB2B4ZQMdlnpLJjFf+HuGMFeBfupo8j0fkaq
 6QrG3gdhscA9jUMMdB31hXcCjGpLrPFq/zvaufM6M86kNCOPNARhdG/XjxjLzGnXAsvFx9Oea1T
 yhSwwTyfLRE690ftj8CyHks3AeQOvnp4yHWKKadhV/8GJWi+pfhal0fi+f3hiDIa5izwDDoR2zn
 pA9ePYTBpEIrM1QpPdpK3aeRX0x6FETLxno9vdPcInwB1vwPDJThNKc2NKx4No8Yo3li1E3jwqT
 XYsrchq4ofcyxt8+/pw==
X-Proofpoint-ORIG-GUID: j0P0M66PIzUiSukrtwGThxVabPLqdhND
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695b4464 cx=c_pps
 a=1w3Rox83O5gulhrCDwffwQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=V3_p_re-iRoMhaphfvQA:9
 a=pILNOxqGKmIA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: j0P0M66PIzUiSukrtwGThxVabPLqdhND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050043

> v7:=0A=
> =0A=
> - Reimagine the PHYs as individual nodes.=0A=
> =A0 A v1 of the schmea and driver for the CSI PHY has been published with=
=0A=
> =A0 some review feedback from Rob Herring and Konrad Dybcio=0A=
=0A=
=0A=
Hi Bryan,=0A=
=0A=
Gentle ping on this patch series.=0A=
=0A=
Since the csiphy recode new version has not been updated, =0A=
and the DTS for the unrecode version has not been merged. =0A=
As a result, the Hamoa-related camera patches cannot progress and have been=
 blocked =0A=
for a long time. Could you help us resolve this blocker?=0A=
=0A=
Thanks for your support, and please let us know if there=92s any blocker we=
 can help resolve.=0A=
=0A=
Best regards,=0A=
Wenmeng Liu=0A=
=0A=
=0A=

