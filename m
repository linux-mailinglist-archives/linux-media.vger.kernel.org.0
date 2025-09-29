Return-Path: <linux-media+bounces-43336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA46BA91E9
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 13:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC55E1618BB
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 11:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7519A2882D0;
	Mon, 29 Sep 2025 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b="kdaxfl1H"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578713002D7;
	Mon, 29 Sep 2025 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146647; cv=fail; b=V1aaW24yJgiBq88P5nl/dzwjwC4cld5hEtd+gmSeHFHajeZeafg+gXvuyyiGZHWlo9m/V6OdPcC/PoPnwhBrO39U3k7+qXGFsAFqfUqfw0c0X7Mr2A6y1JKU1xfWByOM1+Je7/0eLvLmJGUHUBywaf3X6j7fXji+YUYvJf98CFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146647; c=relaxed/simple;
	bh=GfuulTjTBzNLNK/ubRb0/9R2Vyb/PKutClYafloAotU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ev4l1tal/EtiT2uy1ohckTMANuJTAa5BXnGXoGo7aKS0aa1I5f/JR0vPQCgLBWPfQ6DxVVXnAK8eHOCqge+J6qc6X39hTvoe/LxujFRpEj9rEDuUmegEdkJKnnxW0x/eVyKnqA8gEotyXaS5O8LQLAqYy2tnPAo6VH9Lp93mlfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com; spf=pass smtp.mailfrom=realsenseai.com; dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b=kdaxfl1H; arc=fail smtp.client-ip=40.107.201.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsenseai.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1N6+VO7HGvuRQsYsmm1NrpXc71Mq2B/F/14gFAISZWpZCG4ZBEh5uN4aVgbOsmGLPx/nsw7/VXh71BEmZCNgVUWLC0xxY4EAkdWQtuiU9no5GQwKlIVjf5HgLg0i2vkYHN5Uw3geLs+PLBdPM+vsWMPx8UXo3illhA2+zbhQb+affyiN6cXkDIcK+iPl97PtqQfdxJi0UQ5wt/XRrhvWpo2eaa3SVu6rqX4aD9q84nWB4p2yW7umj0fOlpvzdfbZnKNeRd0SlwVO9vmygYZR3C0AzkVyg5g2Gs+wrcpIIgnNPtuCkykkkqrQ+TDm1/OUr5/2OOpjcP7idje6EsZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIDTnOKq6gDLz2vahUruelvExVFOYPJY188Wo2T2fZ8=;
 b=OA49mvVvAALdXBd0UGbkd6C8UUyqbUjEmOipxHNr6V77RcSXG9NOiki0sEm0aNdHXwv62iyfJmBfRhdJljA6Gcw7NjCm6k9589QOeau2sEPxXazzujxf0T4Z/49YzGQa056228Zk6mNZsyPTCHYsES8WbDRrU7Kv9Rdw2TARUixn2i0XxB8Yfonh0SitpoJemIfuAnVD0IDwz8rWeeb4iF2J8ssJvE/hYni2feEYig2e54UZP2EfbF+BofsijkRC5wsIRjFvIGC6aSIw/f4hOzB3lbF9ZEvdidGRWc9UVWd62J7BeIbzP4qwiF2iH7udUqVMr455yTm/ENAEIPIYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=realsenseai.com; dmarc=pass action=none
 header.from=realsenseai.com; dkim=pass header.d=realsenseai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsenseai.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIDTnOKq6gDLz2vahUruelvExVFOYPJY188Wo2T2fZ8=;
 b=kdaxfl1Hr2jOqnjlvsVVcBklL1buweCaJselBGYLvp0cgflBqSlhQTVEBc17vcsp6Qg3wGD5QsodAJYxzmsgucK4dHF1ju4To/YGUoGORi8nqbXxY3+fuSj40LkpP1/7T/rTtFYOVIqqNZRkj6IJ4n/8yvNJyvsYEtq4o9ddOylyBHogK9vvD7q6/ayU6FEjtNjriQmrzG8+lsFdESESzCYWwb47KHDWKawN1Njsd4Jj7nFKw/Qc4ZQFsEJXFq5URhym13zYxJusJQpvzMDd2k8t6d7Dt34r4gYYYBeXdindDl0gtdSYgXRicc3dEgho8YzAUj2Sr4ug3h9L28LqZw==
Received: from CO1PR18MB4633.namprd18.prod.outlook.com (2603:10b6:303:e0::23)
 by MN0PR18MB6096.namprd18.prod.outlook.com (2603:10b6:208:4bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 11:50:41 +0000
Received: from CO1PR18MB4633.namprd18.prod.outlook.com
 ([fe80::46bb:cd89:8845:c8e3]) by CO1PR18MB4633.namprd18.prod.outlook.com
 ([fe80::46bb:cd89:8845:c8e3%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 11:50:41 +0000
From: Gladysz WojciechX <wojciechx.gladysz@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "kontra.wojciech.gladysz@gmail.com" <kontra.wojciech.gladysz@gmail.com>
Subject: Realsense camera patch
Thread-Topic: Realsense camera patch
Thread-Index: AdwxNSInE2qChUh1RV+NioMCNhJnZw==
Date: Mon, 29 Sep 2025 11:50:41 +0000
Message-ID:
 <CO1PR18MB463349680603EC2C284B7FEFF71BA@CO1PR18MB4633.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=realsenseai.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR18MB4633:EE_|MN0PR18MB6096:EE_
x-ms-office365-filtering-correlation-id: 04ee5db7-096c-498b-787c-08ddff4e6aa3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021|4053099003|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?TgXP7WbtiYUs5Cw60kwQigdUJKcQhHFKsiVgrwiSnv7fkl6edRhm0HXryt?=
 =?iso-8859-2?Q?dsl7Y/FRRgGoqUivOvcEV4tW1gP1x/NYgOkvG0f9e282BF86lYsgAX98zg?=
 =?iso-8859-2?Q?1B7z6wtqsDsletn2XT/osI/3WV8NDIgT9FNA1GvBFM43qAvUSaoIFWWlU8?=
 =?iso-8859-2?Q?AMmG/BKGiPwld8KkSVrme/Gz6HxQEhez8R4uzL6ckIbGQWkeVYeyGPRuR8?=
 =?iso-8859-2?Q?I8zvaIytHaMun8fDTh4+1jGjMp83H1fpuodm3XMWIIHP6i93EAE8W4bI7f?=
 =?iso-8859-2?Q?hE4H+CFq8YAbC3EXqKl0lAQpHfFKeJ4HxyyFoIk6OLhJh6iZRdABAGDDEE?=
 =?iso-8859-2?Q?ORxsQ0vrNSrYGvtgClkh2nxbunUtCqEylmhTRqdLM0vKcIG1LxDAxC4hQa?=
 =?iso-8859-2?Q?NSD4H0B+tXxsd1JdAeRFUr4JdoB8V/BIHBMjFOS6vQ63AY1B1tK43094R2?=
 =?iso-8859-2?Q?7wdGMVK4Hp8e8EzurazXN575hz8CxaXIin76VXqTdb5GM6txbp9XVbGhbq?=
 =?iso-8859-2?Q?Eh4Y36QuozFtlKES7ZZiHYJKi5ts4PI5wmJVutFzYL2R1u3MLQCHbYilkT?=
 =?iso-8859-2?Q?vZeC6lN4WciNjcPHWvhGejcRoagiHyOsiXcX3eD+fhhp+EVYydKLs1z2an?=
 =?iso-8859-2?Q?IDM/TXXaYIh8/lXBf96xyHYX746nWXBOTq7UEEC1ekhE+bx7mcojxUGVnF?=
 =?iso-8859-2?Q?dJUuJLk7rT3zh12m1aNTy+o409C3ik9lyESdGzNHRckIyuuP1h7JrmjqNM?=
 =?iso-8859-2?Q?Kb1zWduavnUbncnPO8keS4umnfgjd3DZANF8f2q6ehuiEdtN7qXxJKb6lj?=
 =?iso-8859-2?Q?XBJbR/QdDx74qNhNtvUzUOmq3YArkZpPt0AhmmqTvpvzKfPNiIAWqDwBSi?=
 =?iso-8859-2?Q?t+aCNQP8NYpjTVXCcfvzwDGQfsdEQjw2SArCX+XTKkOYvxlJTZh0HmAvAv?=
 =?iso-8859-2?Q?UpZtru9rgf9tPauKL3iH/r9/EZ8IG9Ft/LO+6VakWKIRDgWmVWzZ+x+s41?=
 =?iso-8859-2?Q?vLE6uYfvH7lAxmkbtFjpHjlvthChK/6BvgK77Q6Uwh8WF1VP5zCAyKZfdh?=
 =?iso-8859-2?Q?Sl+3bs1H3fKvmBHb/J6WHMkBcZF2zLnHsJ/fsIjXvjvcgD8Ew5BinGDHz+?=
 =?iso-8859-2?Q?jFVC8LWr13VzQr64wzKyUZFo4UzlIdLeko6mAQOJ9IhUUjptB1Sjy0ahaE?=
 =?iso-8859-2?Q?vTiZ+jKtIYBRS4sjXB1Vi8Z0cIqAoemf+cQQpy+10lXjymMtZNA6Z395ZI?=
 =?iso-8859-2?Q?CDQ4xgGDed1TOAdwjXkJDtGPXI9+YvDKAQazn4fLaLrRScwKFFdlDt675I?=
 =?iso-8859-2?Q?hUFq/vt97qo13FPEnAU+4ErxcxccYhrIfRJ4/M78QHkaoQ+40O5XrJuI2U?=
 =?iso-8859-2?Q?2mPA0LsYfljIzvMDf13pdhinP5AB7rgJJXsBsQXPNxl/NdHy+EHAd1SHvR?=
 =?iso-8859-2?Q?Rgdjsh4BJoltFTC2gnlIPY0VIKgPkoIWjebQZmuzEJND2QCewgHRELKV87?=
 =?iso-8859-2?Q?2MSO2Bt6nV9RfR0Cww2hS9T3QZrQTVMyxhQ8p6tLdIHHZYPcjJwovrwwyx?=
 =?iso-8859-2?Q?I/LdgF6i4ZNWgFo8czA7mZet+rDO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:nl;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR18MB4633.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021)(4053099003)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?fjVZlq69iWuSQXxeGzfCWR7Z5aFvATGKL+oZAoR6aHwb0MT4c5BRnivyss?=
 =?iso-8859-2?Q?LX2/ohz3qSgH8GqjMTj/nsGFTyCnCQ5LUzRAn8PD0jP563nrLRGrEGfdHd?=
 =?iso-8859-2?Q?lXwrg/5W/b5w6a0RGgLir7ibcBPu5oWBzE6IVaCvwGriZOgghTBczDHgYo?=
 =?iso-8859-2?Q?wZIeMoORb8vKk/iSlo7Yr+srcifEicFWXW5o19DjQ6uZangU4q8r8KYkfE?=
 =?iso-8859-2?Q?IldekCGd+MVmi86x5yPHolfM5sxKwyLsrjTrvFKXPpcEzW3eVI4SG6/Un3?=
 =?iso-8859-2?Q?UPBFk2Cz1Ur8RQf4Z/O8an3TU2AhM2oEJENQzdHsFfbxJbVLIe59AIqSSY?=
 =?iso-8859-2?Q?BP2b+GN4Q8qId93pUuIvEVdkxAjbJ/iGGKHTKfzrOyLvGzlK4YQYcFMPU+?=
 =?iso-8859-2?Q?zyLENJMQup+31KPMgR6d+UHT6KixLmLhkxYXcX4OnKpZ11BGKLRC4tpCt5?=
 =?iso-8859-2?Q?zlLCFkAL4mVulvqFGVcV/tTwFqtFjsJxPEcg6h7rjbxL5i32FD8Ok2CCCq?=
 =?iso-8859-2?Q?1jZaHAB9XwY7twDUpPlh+m+J0RxYEebD0FVJyRHcU/k+wiyRBF5DpI0Aio?=
 =?iso-8859-2?Q?1NsKcHjLU9zoy88rKLhuRIA00gogiNSPflPmdw0zkqcbT1wdlgWoUBtbSx?=
 =?iso-8859-2?Q?SEG0USTTeSjhMB++5wX4IgHYTpo7ua7j3tQhM8LbhoszTbTpnFNl8G5+z6?=
 =?iso-8859-2?Q?eEeSMAf10SS7OigAQ3IA1Ffu72bBfow5vuiCyNLkOAShqsdNlWUNKozq5D?=
 =?iso-8859-2?Q?w7IhtnGxspRJ31J+zHvJq60BqMuv7zF97sUT0trguS37JQKZ/Qf6IgBKH/?=
 =?iso-8859-2?Q?BLJZq3tMtITqSS6yYNHw+ze3cOf6gpsrr9KZLAe2zMLdCnldelojrwYDHh?=
 =?iso-8859-2?Q?GgRY6gB1Z91v10TyJLi1f4VuN1ykGazQ8Tnq4Z5A4egSBEhxvOCLInuEDA?=
 =?iso-8859-2?Q?ycJHw05Jhff5Sz7ngG8ZRsbvS29WA0JQaxQMda4bG95QDhw2PiIAnk2b6S?=
 =?iso-8859-2?Q?l2rWTgeu90HdQv3O7vEgouxxJcBGMrTAv7VJrTXwP+H9M7T/gpoQ7MvIcB?=
 =?iso-8859-2?Q?7jiAJ+s3XKeeeKM7KiwR5MJj5oZHrD6zk+AM8gsmQQZwDXC/JBYcvWWd/G?=
 =?iso-8859-2?Q?piXJ2eG1GeOSJQQc/CTNOjZxuWDYlXAgx6k8espoLYlBvuq8xUXoZcZWd8?=
 =?iso-8859-2?Q?gKPbMCx4+YllMxT5IapY76uVl6Jw+xVZehTxiAdYiRkOB99cemqhPZpT4t?=
 =?iso-8859-2?Q?paJKVwzgbTIIGLU2WqEgXYy99Y0wUM+9czdZjNhkHsh64h/7qFwOLhzW9P?=
 =?iso-8859-2?Q?qyAy1By6HEgeuYeC+FHsn+WxOJo10l27EBBWnIRIrAYGddMgOtsXPU1IJF?=
 =?iso-8859-2?Q?4aKQyqUTDVG93iussiTHZLygSz8IIwZVj28ZsWQHsQhXre34WkTFE7p6Oz?=
 =?iso-8859-2?Q?NPYVZ7c+P5wX3VgSlMaZ3NJFe4rlmzOEwCkALWFdDnMWpVFQKfkminhGzp?=
 =?iso-8859-2?Q?sR5oBQzXfi/4gXrtimlKRE5InLBhSNFL8698EPXvvPmaHDIyFqpo0hWtW2?=
 =?iso-8859-2?Q?GKF03mMfg9Mx7qqy2V+XxiQ7HG2RqKDTPvPBNwVYqmDpJKUL2WYD603PKR?=
 =?iso-8859-2?Q?I6+QHIr96IUqyDDNMLXsw9e3cFkPb/UsCPtMkAA05wnkZIw9kWcQ4wfw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_004_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: realsenseai.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR18MB4633.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ee5db7-096c-498b-787c-08ddff4e6aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 11:50:41.7805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 900a1806-5e7c-4a61-ba52-40ce09b89e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n19KmH2pW1FJc2Yft61Ydgn8VZmcXgqDpI1IIUTe7ovdy1TMNr+kJ3Tn+k9gtzDTy5+Ee0eB7rKB+UJV5Ea/h/KR+IZFgEymw12QFMKYR3cjW4mqzrTNW3sUJkAbwmFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB6096

--_004_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_
Content-Type: multipart/alternative;
	boundary="_000_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_"

--_000_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Kind regards,
Wojciech G=B3adysz

--_000_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Kind regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Wojciech G=B3adysz<o:p></o:p></p>
</div>
</body>
</html>

--_000_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_--

--_004_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_
Content-Type: application/octet-stream;
	name="0001-metadata-for-Realsense-D4xx-D5xx-cameras.patch"
Content-Description: 0001-metadata-for-Realsense-D4xx-D5xx-cameras.patch
Content-Disposition: attachment;
	filename="0001-metadata-for-Realsense-D4xx-D5xx-cameras.patch"; size=2739;
	creation-date="Mon, 29 Sep 2025 11:22:22 GMT";
	modification-date="Mon, 29 Sep 2025 11:50:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMWViNDBiOTY5MjRmMjllY2QyNjYxNzY2NDUxNTJjZDYyYmVmZGFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXb2pjaWVjaCBHbGFkeXN6IDxrb250cmEud29qY2llY2guZ2xh
ZHlzekBnbWFpbC5jb20+CkRhdGU6IEZyaSwgMjYgU2VwIDIwMjUgMTM6MjE6MjAgKzAyMDAKU3Vi
amVjdDogW1BBVENIXSBtZXRhZGF0YSBmb3IgUmVhbHNlbnNlIEQ0eHgsIEQ1eHggY2FtZXJhcwoK
QWRkaW5nIG1ldGFkYXRhIGZvciBSZWFsc2Vuc2UgRDQvNXh4IHNlcmllcyBjYW1lcmFzIHRvIHV2
YyBkcml2ZXIKClNpZ25lZC1vZmYtYnk6IFdvamNpZWNoIEdsYWR5c3ogPGtvbnRyYS53b2pjaWVj
aC5nbGFkeXN6QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZl
ci5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNf
ZHJpdmVyLmMgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jCmluZGV4IDc3NWJl
ZGUwZDkzZC4uNDVhNmY3OTcwNzkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMv
dXZjX2RyaXZlci5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMKQEAg
LTMyMDgsNiArMzIwOCw1MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXZj
X2lkc1tdID0gewogCSAgLmJJbnRlcmZhY2VTdWJDbGFzcwk9IDEsCiAJICAuYkludGVyZmFjZVBy
b3RvY29sCT0gMCwKIAkgIC5kcml2ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9G
TVRfRDRYWCkgfSwKKwkvKiBJbnRlbCBENTU1IERlcHRoIENhbWVyYSAqLworCXsgLm1hdGNoX2Zs
YWdzCQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFCisJCQkJfCBVU0JfREVWSUNFX0lEX01B
VENIX0lOVF9JTkZPLAorCSAgLmlkVmVuZG9yCQk9IDB4ODA4NiwKKwkgIC5pZFByb2R1Y3QJCT0g
MHgwYjU2LAorCSAgLmJJbnRlcmZhY2VDbGFzcwk9IFVTQl9DTEFTU19WSURFTywKKwkgIC5iSW50
ZXJmYWNlU3ViQ2xhc3MJPSAxLAorCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IFVWQ19QQ19QUk9U
T0NPTF8xNSwKKwkgIC5kcml2ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRf
RDRYWCkgfSwKKwkvKiBJbnRlbCBENTg1IERlcHRoIENhbWVyYSAqLworCXsgLm1hdGNoX2ZsYWdz
CQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFCisJCQkJfCBVU0JfREVWSUNFX0lEX01BVENI
X0lOVF9JTkZPLAorCSAgLmlkVmVuZG9yCQk9IDB4ODA4NiwKKwkgIC5pZFByb2R1Y3QJCT0gMHgw
YjZhLAorCSAgLmJJbnRlcmZhY2VDbGFzcwk9IFVTQl9DTEFTU19WSURFTywKKwkgIC5iSW50ZXJm
YWNlU3ViQ2xhc3MJPSAxLAorCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IFVWQ19QQ19QUk9UT0NP
TF8xNSwKKwkgIC5kcml2ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRY
WCkgfSwKKwkvKiBJbnRlbCA1ODUgQ2FtZXJhICovCisJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RF
VklDRV9JRF9NQVRDSF9ERVZJQ0UKKwkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8s
CisJICAuaWRWZW5kb3IJCT0gMHg4MDg2LAorCSAgLmlkUHJvZHVjdAkJPSAweDBiNmIsCisJICAu
YkludGVyZmFjZUNsYXNzCT0gVVNCX0NMQVNTX1ZJREVPLAorCSAgLmJJbnRlcmZhY2VTdWJDbGFz
cwk9IDEsCisJICAuYkludGVyZmFjZVByb3RvY29sCT0gVVZDX1BDX1BST1RPQ09MXzE1LAorCSAg
LmRyaXZlcl9pbmZvCQk9IFVWQ19JTkZPX01FVEEoVjRMMl9NRVRBX0ZNVF9ENFhYKSB9LAorCS8q
IEludGVsIEQ0MjEgRGVwdGggTW9kdWxlICovCisJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklD
RV9JRF9NQVRDSF9ERVZJQ0UKKwkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sCisJ
ICAuaWRWZW5kb3IJCT0gMHg4MDg2LAorCSAgLmlkUHJvZHVjdAkJPSAweDExNTUsCisJICAuYklu
dGVyZmFjZUNsYXNzCT0gVVNCX0NMQVNTX1ZJREVPLAorCSAgLmJJbnRlcmZhY2VTdWJDbGFzcwk9
IDEsCisJICAuYkludGVyZmFjZVByb3RvY29sCT0gVVZDX1BDX1BST1RPQ09MX1VOREVGSU5FRCwK
KwkgIC5kcml2ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwK
KwkvKiBJbnRlbCBENDM2IENhbWVyYSAqLworCXsgLm1hdGNoX2ZsYWdzCQk9IFVTQl9ERVZJQ0Vf
SURfTUFUQ0hfREVWSUNFCisJCQkJfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLAorCSAg
LmlkVmVuZG9yCQk9IDB4ODA4NiwKKwkgIC5pZFByb2R1Y3QJCT0gMHgxMTU2LAorCSAgLmJJbnRl
cmZhY2VDbGFzcwk9IFVTQl9DTEFTU19WSURFTywKKwkgIC5iSW50ZXJmYWNlU3ViQ2xhc3MJPSAx
LAorCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IFVWQ19QQ19QUk9UT0NPTF8xNSwKKwkgIC5kcml2
ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwKIAkvKiBHZW5l
cmljIFVTQiBWaWRlbyBDbGFzcyAqLwogCXsgVVNCX0lOVEVSRkFDRV9JTkZPKFVTQl9DTEFTU19W
SURFTywgMSwgVVZDX1BDX1BST1RPQ09MX1VOREVGSU5FRCkgfSwKIAl7IFVTQl9JTlRFUkZBQ0Vf
SU5GTyhVU0JfQ0xBU1NfVklERU8sIDEsIFVWQ19QQ19QUk9UT0NPTF8xNSkgfSwKLS0gCjIuNDMu
MAoK

--_004_CO1PR18MB463349680603EC2C284B7FEFF71BACO1PR18MB4633namp_--

