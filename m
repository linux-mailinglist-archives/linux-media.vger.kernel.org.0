Return-Path: <linux-media+bounces-12905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB23902D71
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 02:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 387812846FD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 00:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFBCBA46;
	Tue, 11 Jun 2024 00:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="EYM++nZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D4469D;
	Tue, 11 Jun 2024 00:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718064103; cv=fail; b=Tcg4LAvYsw8W0TBdIZxynJ7Rc5X3HIK97d24CYfwyrZbTF458cZWXfIuWwjdb5yGc8vwt62iEzll310PmoGMlh1ij8M/kZ3QkqeZq105i6zy4UM7reO0KyKydZwpM//0Z4/i54oR9zd2o3r3PcudTM09+lmPbHSDZtAD0k+L7j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718064103; c=relaxed/simple;
	bh=DWTiXrxBpV+JLYE/6oyYEp/SWnuOOKJaXEdhasrJU3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BnnSqYSx2gX3JG4gQVSVtwqguSbuh2XF4DSUAslISFpgrKMdz55p1bCY9m7zajfDbgz5qCBRwVvyHHJ+jXMZGa429JkEaPKmThuSY344R4l4M/idIUsOl0W6CIRa0/1gcBWmLAU3rjmfOf1L50TckhzOkQePy9IJXQAcWysEGYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=EYM++nZB; arc=fail smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1718064078;x=1719273678;bh=DWTiXrxBpV+JLYE/6oyYEp/SWnuOOKJaXEdhasr
	JU3s=;b=EYM++nZBVbVBo3UvgPnlG6vv09wzjIJpw/34u3y1jXVJ8W6HspXRolk2om0AJ9Al7umoq
	GdPuUmul1YLmktwLvkhI96QB+140ebNgAG6FXBn6ZQYvY4l5a4OVVDcCLSf2FvAW+FVidQfOo6W1i
	l9g8ERCVg3c8F6sp331xAc42DdT5f26w1n/cUgd6PB4HOlF3IaGzIZcxAFpddtpSk/cA3WCEf4KZp
	Ml7kaQ79qIaeWVVU79nK241+MyfTPNISYw7nVUJoB/UUuNPc/aYdFGQ9GSalY9Ych783rXhyWKEPi
	Qk3X6WALOCRW4BPQrebJFYPaknkKKReFj8T0AwyARg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 45B01HoJ2003360; Tue, 11 Jun 2024 09:01:17 +0900
X-Iguazu-Qid: 2rWhrZaA728A4sfREU
X-Iguazu-QSIG: v=2; s=0; t=1718064077; q=2rWhrZaA728A4sfREU; m=tgwaiWqhmr0kKDK7MqccQBuEQ/0QoOTQVahGGnu0KhY=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1121) id 45B01FpX2437567
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:01:15 +0900
X-SA-MID: 22951629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgEIerQ5GHe/X4cl8ATsfaD2EXi/Jy8hKzTO6lKv2TvI8gMBE5+EM1o3hjpL2cP4t3B+2sOLma9C7S99RiCKMn6YopKROdZCHuSoxm1sPT2lwnuOQvnqgBn6rWadAwe2981TW/fTmZMiT1M6sntqFDjqlAAylINF8gQkkpwYtYeiGlVv3pjRrtTYvEdLmj85w2Dq+BzLVyodifP4LHVvTNCivC4G+92ohzNlHmrmw2VxS5pyuhBHczSSCCgVk1wznlBzsk8LjvVprb8nGrdY46/3uYnSUZhobcZyM8OouG9wpUk7m7hyrTBU5X3FdmcwHlytndVBtXii1B4tp4zibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWTiXrxBpV+JLYE/6oyYEp/SWnuOOKJaXEdhasrJU3s=;
 b=lWZc9dKYtuWJeF4+7V5RFBBzdJM4BmZqfRVZSOqYIEo9YEAE7jxkvsR+2vzjy2F9g6gdFQgSOWP+GN6cS333Nv+3LZB8LzI3XFDYtpSRR6slmV2HrZ288wwl5jDuFV/yS4Exkscj9XeudZ07xtW1Xbbdnjbg8xnEwkCvs67pZpI3GfliA+Aq7tre4lJradG06fe9GJgTetItX+A7ZngSlK8w3XosDU9IAEO8ykUF/0qKOiysT9mab+5ZjOto/cfyxDcMS7yuhr7icKIN5aTpbvS/3xFC+RuPxhC5El2bBiD0b8KmKCapf92kEJbblNneeVgSXdyyX4Y+/0hshDuMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael.j.wysocki@intel.com>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 0/6] Add Toshiba Visconti Video Input Interface driver
Thread-Topic: [PATCH v10 0/6] Add Toshiba Visconti Video Input Interface
 driver
Thread-Index: AQHalfEMQ49icSsmkESF0IEAAdUuCrGxaAAAgBCPbaA=
Date: Mon, 10 Jun 2024 23:56:04 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OSZPR01MB94271F3988824FC33218D13892C62@OSZPR01MB9427.jpnprd01.prod.outlook.com>
References: <20240424024215.1624299-1-yuji2.ishikawa@toshiba.co.jp>
 <6dce1ca0-78bf-4a4a-bdd6-ff6647eae6b6@xs4all.nl>
In-Reply-To: <6dce1ca0-78bf-4a4a-bdd6-ff6647eae6b6@xs4all.nl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9427:EE_|TYWPR01MB11361:EE_
x-ms-office365-filtering-correlation-id: a6ee7540-bb7a-4139-6915-08dc89a8e3f1
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MnozL1cxK3J2dkVsb0tycjdCNXNLQXRna01CQUUxdDhEYW1FbWNiOWJPQTBV?=
 =?utf-8?B?TU9vM2hlM0ZtRmgrWUw1Z0lrWXRGbmxWZTdHMFFrclhhV2RVTjRMbE5yaThh?=
 =?utf-8?B?MzZwYmh4MWdKWTN2NFBxQkdKN3kvUGZtd2RVWnFBTUs4Tk1TOTRUYzZxRjNL?=
 =?utf-8?B?MTV1dGRuUnhRT09SWWV1V21tVE5WbVF0Snptck5OaGdZRkNOU2Fac1U1UzVw?=
 =?utf-8?B?TTJJYlNkMHJLVnJ1Z2RlMG9TYzJvUk05Q0lObWUxWmtGREpDcFV6RStnVmFy?=
 =?utf-8?B?RzFVbjQraXZ1WElDdDRYSGVQVkdoMWVpT3VxeEJmamlEc2hTZUV4ZU9qUlpM?=
 =?utf-8?B?SDN1a3hrT29MQ2VaYkE4U0NOM3pDOGVXZ0ZNeUVHblhkaXcvT2QwV0pkSnc4?=
 =?utf-8?B?cHQ5OUNhRlp0cE9OWHhCVUs3d0lVeWpkNXVPc3FERlJOZGMvVllIclR1RzFF?=
 =?utf-8?B?cEExRTl2SkJhWTZSYmJYZmRQMkhtaUZKQ0VjZ1c0UjJPTkFVOHVqUUc2K090?=
 =?utf-8?B?eTVDWUx1M0w1NzNyV1pna3cxNzZjTGU2TERKSG53dGdpRWNuUXAzTW1GejRC?=
 =?utf-8?B?T0FYWXZDWTdoNjR4RjZ4NU9GRkVUaGovVHA0M1FqNzJFWUU5TjlBbkxyaVhU?=
 =?utf-8?B?MllnUlZobUNaTmZCMGFZdG9icmhIUllYeDZseE9ON1d4dVNkV0pmV2xZMGF4?=
 =?utf-8?B?ditxd0xXZlJnNG1jTUM0NG4xQkRVUSs4cnVtZGxNc1YrSldkYVFZZnZjYmZP?=
 =?utf-8?B?bW5JYWxNZTBlTThaeTRwZWVVaFBBREdvOEk3S2tNNTRic25uVWpNd0k2NTUr?=
 =?utf-8?B?TEJGcHppUTg3RHBnUWVPUS9kbGhMY05rKzdpM3owbmY5Nm9IZGQwanNBbjNm?=
 =?utf-8?B?LzdrYkdmcVJOS3BrLzlUNkQ2cG4vaUlmditZVkZWYWRDd05PRFl0L0JhSi9t?=
 =?utf-8?B?UkVOOTVQdXlKMEJXV3V0Q1dPN0RVaytJM2lVMnlVNzJtQlE0TGJ4QmpSSVl6?=
 =?utf-8?B?Snh4YURiSUpWcEJqM3dtRFVmL2VpamEzYndLRjAyQzBVQitpMDFuWHlGQ2JO?=
 =?utf-8?B?QmNlSFVXejd4aThBZU9nUE45L2l0VnJ4WnZvZVl1UUVJTHZrNk90WlVHRFpN?=
 =?utf-8?B?YXBqTXpZRFFvNGdKOFRic3puMkdNLzdJS0pscEF2S0g3NkJvaWowR0lralVB?=
 =?utf-8?B?NHBIeVFlSndBRml5dnhBcWtMaWRqNlc5U2dtR3dyUnNIKzhOMFMwVEpJV0Ez?=
 =?utf-8?B?TTh2NWhVSWt3NGFtL0t2c1BWWjRBS0hsYXkrODhkcldubnBHNXB2OEZyT09r?=
 =?utf-8?B?dG80SnIzY2ZBVngwYlZ1N2FDZy90UUEzL3d2U0FnSWNZTWplY2xmQVdXT3Uz?=
 =?utf-8?B?ckdWMTlIUHl4azdVSmlBN1JnUVRPazA2ZStSZUpnaGN4d3F6QnBoY0hBQWlp?=
 =?utf-8?B?RWloaDFORlZ1NlFudFVYL2FyQmE4bXdzblcrNTRWcHFrYmtvVzRmMTBpaDZP?=
 =?utf-8?B?S05zL0hZbG5MdktTb0hGbXVxQm5hYjcyaE9DTURzSmV0bTFvRnkxQlNJam9P?=
 =?utf-8?B?LzJ4Uzh3dnJVVHBJT2RNV0JwUkduTnVHREIzaGtiNC9RNzA2SFRpbVFrbDdF?=
 =?utf-8?B?L2dpS2JsK3BYNUtSWTE1ZWNDSHhEK1lEa2YvQU1jY0FrTzI3N2E0M09zQ1Fk?=
 =?utf-8?B?Yi9zN1ZIR3k3aHlzaGFnZGk5RUF4empCVXJHOHZzN0xUUDRhOG5HRGR6cVBQ?=
 =?utf-8?B?ckw1UDRsZ0hGK2N6cGNSS0t5UWduRE51aTE3MDdlQ3hnYU84NTIyRlhTekJM?=
 =?utf-8?Q?SPiBJmCl3xx1B6xzCpS9WjYCFSK9VHm61XeQU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB9427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3JsSi9pT2JMMEIyeFVybjNuV1UvbktVUzhCNTc3Q3FjZHdTOERqbHRjMklM?=
 =?utf-8?B?b0xvSk5NUUxzK3Y3b1pZODJ4NWFpME9WM2dtSWY3QjUrTVY1VFhTWnRsUHV2?=
 =?utf-8?B?K2tPRFpGMnArZVRpUlQ1cXRmK2hidEo5WlFnSlkyR0dCNDV4V0tUMjYzSlN6?=
 =?utf-8?B?eUh0UlR5Y2NUb05IaUxEUDQ3MENqWmZFL0phSjBud1RRUm45MVc2YmlLWkI4?=
 =?utf-8?B?SDRmQ2lucU5FTTFndHFzbDlwSFhoTjJTeFFEWVZBNkY1V0MwQVNQSkYwZEx4?=
 =?utf-8?B?Z1lKcEgvZjVYMmQ1WlBKYjUxSmR2cHFrbzR1Z2dLeUFTTzk2OWxjRjEwK0ZR?=
 =?utf-8?B?cm9sdDJDSVRIdGsrcHM4QTBFcTh6aGJHVWRQSHBzNEMraHJHT2xTVW80bTFO?=
 =?utf-8?B?ZWg3SHR4WXVuNDV6bDh1cnhTUjRyS2F1K3d6NGd3QUk0YmhUc2pjVUNZZ1R2?=
 =?utf-8?B?ckUzWHhOMC8rWW4xa3NBMUo5b21ORFlMWTV1TkQ0WEV0UjF3MzgrWDNVUnQr?=
 =?utf-8?B?bjdHZDhlUUxYa2toOHd1akNDMFlVWVZMRHFETXNUaXRxbTlhb2o4VkhlaW03?=
 =?utf-8?B?b1VMMTVDSnNUV214WkoyZXhKT2FtbGtvcmRYV1hndGQ1aW9kNVdhRnpDQ2dw?=
 =?utf-8?B?dWdZUm1HdmRVVlVzT01NbG5PZnhXa0VTK2IyMGl6Q1Q5MTMxOUxEdjJKdFV3?=
 =?utf-8?B?bUhxK3VTSWthb2I0cTZIRUo0ejhxZVZ3cVZUOVpoUVFkSFlSVFcrS1BDdVNy?=
 =?utf-8?B?SWFTa2h5ZkE4aWNEcDQ0cWdiWHMzZS9JZEgwL0pBWStsSWtIV1JYLzZOem1E?=
 =?utf-8?B?bk1ibkkvT0RrQXFKeFFSRHk5amJHZWliQld1Mk0rWjlhSnNCdHk0aE15cHc5?=
 =?utf-8?B?STc5aHFtcHhJS3E4dGRqMnU5aG9NNDdCSCt1K2JrSCs3YUxJeEF1ZDNKR3pF?=
 =?utf-8?B?NDQ0TEVVcWRzN2NOaGQyeUEyTlZuUmU4Z254dzk1OUM4Wmh1YmMrVzdUQ0Rr?=
 =?utf-8?B?akcxSllEcStLVkRYY2V0bHRrbG5BclFzZm96Tno1SWdMNzUzQkE1bjcwMU9H?=
 =?utf-8?B?YitrOHl1UndoeUpBUmtLaGwxYXNoK3VkdXp3Vlo2bWp1QlF1SmhmOE1kQjJQ?=
 =?utf-8?B?cWFaeWwzOEllZXVGQ2tJZjdwQ2E3eWNONXQ4Vi9YeDd0bXY1MFYxaWsyNTlE?=
 =?utf-8?B?SnhyaEFoU0xRYW5aMFR6ZmsyOTdBRTQyaUl2WmhIbXFxRXVWbzFKRE56c25i?=
 =?utf-8?B?b0t5d1prbDl6Z2MrTVh5UjlaWlkrdHZKUlZRUkhZdDJ6aC9KUTN2VDNtbnlR?=
 =?utf-8?B?TzRoMmFDd042dkFnQUVUSGd0N2JDYXQ4MWg1ajJBNjhjTm45bUcrdDBSTkNa?=
 =?utf-8?B?UDlrQUpJVmlSaVM2WUlqVytqb1ppZjFLWlJ1SHVYVGxvVDZNNitjOHNSQklQ?=
 =?utf-8?B?YXlIdkpZM3JCWUo2UGU5bkc2TDhsMDdEd3BmSjJsUThrYjk4WEZiNm9nUHlx?=
 =?utf-8?B?WmVpd3dYOE8wY1BXbCtyM1lKbjFVOWhtODVpbElHdGdNUVFkdlUyNEswejVu?=
 =?utf-8?B?cnpBblFkeGt1aVlweXFuSkJuenBaT0ZNY1hOeUZKZEZoditTQjkvcytSWXRT?=
 =?utf-8?B?Tm1jSUd5MzJhM0xzSEl4YTJUcjVPOUxUSnpEMHBtT1RQd1NLczhXWThzanJF?=
 =?utf-8?B?bXF5UmxPbk5ERkFHRVdYb3diZVlLS3pVVGE4NjVueTBnaHU2SlpNakppNUdk?=
 =?utf-8?B?UXVQRTZxWkptQkdrcC9JenluU3BuU1pncFJuOHlZVHlnR0xPWWhhNFNIRk1S?=
 =?utf-8?B?U3oyUWhKSTN1clNxdXcwU2hWNDJ3QVNESmE0b0djQXREWWJucVIzK1RiUm05?=
 =?utf-8?B?b29pWFNGWFdxWWQ5WHhZNmxod3NyaE9HQjdQWVNaR0hEUkY0SWh5a2lpc0Np?=
 =?utf-8?B?SVJCa3R4K1lUOFd2UnphVVo1TmN2SzYvUHpmRytsTGI2MXlOTVlNWTZINkww?=
 =?utf-8?B?Z081QXFBQWZhWnE3b3lFSDNERHdJWmV1R2NFWVNTTlc4UGk4ZzllUGtaZkVT?=
 =?utf-8?B?bm12Yno2Si91TjJNbHNoTWFpc0NUS1JYSm5DVnlyM3RVSnhieFF2K0VWODFs?=
 =?utf-8?B?RHJZZ1l3eUhjcXg3REVZMUtVaGRKS1lKaE9jdzAxcUV2L2swa1ljMXhtd3Yz?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ee7540-bb7a-4139-6915-08dc89a8e3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 23:56:04.5181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV0Zd99HZBblHu62ae59fzpXC0OfZbpBTw++uexRKx4OyczxYhtsXaV0wXdS8ItL25wBm4h1dKGEvx9mRz952Ii6x6wFezzyPn8UsjK3sBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11361

SGVsbG8gSGFucywNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5u
bD4NCj4gU2VudDogRnJpZGF5LCBNYXkgMzEsIDIwMjQgODowMiBQTQ0KPiBUbzogaXNoaWthd2Eg
eXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8oemW
iykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+OyBMYXVyZW50IFBpbmNoYXJ0DQo+
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBNYXVybyBDYXJ2YWxobyBDaGVo
YWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29s
ZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBSYWZhZWwgSiAuDQo+IFd5c29ja2kgPHJhZmFlbC5q
Lnd5c29ja2lAaW50ZWwuY29tPjsgaXdhbWF0c3Ugbm9idWhpcm8o5bKp5p2+IOS/oea0iyDil4vv
vKTvvKkNCj4g77y077yj4pah77yk77yp77y04peL77yv77yz77y0KSA8bm9idWhpcm8xLml3YW1h
dHN1QHRvc2hpYmEuY28uanA+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MTAgMC82XSBBZGQgVG9zaGliYSBWaXNjb250aSBWaWRlbyBJbnB1dCBJbnRlcmZhY2Ug
ZHJpdmVyDQo+IA0KPiBIaSBZdWppLA0KPiANCj4gT24gMjQvMDQvMjAyNCAwNDo0MiwgWXVqaSBJ
c2hpa2F3YSB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBpcyB0aGUgVmlkZW8gSW5wdXQgSW50ZXJm
YWNlIGRyaXZlciBmb3IgVG9zaGliYSdzIEFSTSBTb0MsDQo+ID4gVmlzY29udGkuDQo+ID4gVGhp
cyBwcm92aWRlcyBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24sIGRldmljZSBkcml2ZXIsIGRvY3Vt
ZW50YXRpb24NCj4gPiBhbmQgTUFJTlRBSU5FUiBmaWxlcy4NCj4gPg0KPiA+IEEgdmlzY29udGkg
VklJRiBkcml2ZXIgaW5zdGFuY2UgZXhwb3Nlcw0KPiA+IDEgbWVkaWEgY29udHJvbCBkZXZpY2Ug
ZmlsZSwgMyB2aWRlbyBkZXZpY2UgZmlsZXMgZm9yIGNhcHR1cmUgYW5kIDINCj4gPiB2aWRlbyBk
ZXZpY2UgZmlsZXMgZm9yIGNvbnRyb2xsaW5nIGltYWdlIHNpZ25hbCBwcm9jZXNzb3IuDQo+ID4g
RGV0YWlsZWQgSFcvU1cgYXJlIGRlc2NyaWJlZCBpbiBkb2N1bWVudGF0aW9uIGRpcmVjdG9yeS4N
Cj4gPiBUaGUgVklJRiBoYXJkd2FyZSBoYXMgQ1NJMiByZWNlaXZlciwNCj4gPiBpbWFnZSBzaWdu
YWwgcHJvY2Vzc29yIGFuZCBETUFDIGluc2lkZS4NCj4gPiBUaGUgc3ViZGV2aWNlIGZvciBpbWFn
ZSBzaWduYWwgcHJvY2Vzc29yIHByb3ZpZGVzIHZlbmRvciBzcGVjaWZpYyBWNEwyDQo+ID4gY29u
dHJvbHMuDQo+ID4NCj4gPiBUaGUgZGV2aWNlIGRyaXZlciBkZXBlbmRzIG9uIHR3byBvdGhlciBk
cml2ZXJzIHVuZGVyIGRldmVsb3BtZW50Ow0KPiA+IGNsb2NrIGZyYW1ld29yayBkcml2ZXIgYW5k
IElPTU1VIGRyaXZlci4NCj4gPiBDb3JyZXNwb25kaW5nIGZlYXR1cmVzIHdpbGwgYmUgYWRkZWQg
bGF0ZXIuDQo+ID4NCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gWXVqaQ0KPiANCj4gSSBjb21tZW50
ZWQgb24gcGF0Y2hlcyAzIGFuZCA0Lg0KPiANCj4gSSBhbHNvIHJhbiB0aGlzIHNlcmllcyB0aHJv
dWdoIG15IGJ1aWxkIHNjcmlwdHMsIGFuZCBpdCBkaWQgZm91bmQgYSBmZXcgc21hbGwNCj4gd2Fy
bmluZ3M6DQo+IA0KPiBrZXJuZWxkb2M6IFdBUk5JTkdTOg0KPiANCj4gZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRpL3ZpaWYuaDozODY6IHdhcm5pbmc6IEV4Y2VzcyBzdHJ1
Y3QNCj4gbWVtYmVyICdzdWJkZXZzJyBkZXNjcmlwdGlvbiBpbiAndmlpZl9kZXZpY2UnDQo+IGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmLmg6Mzg2OiB3YXJuaW5n
OiBFeGNlc3Mgc3RydWN0DQo+IG1lbWJlciAnYXNkcycgZGVzY3JpcHRpb24gaW4gJ3ZpaWZfZGV2
aWNlJw0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkvdmlpZi5oOjM4
Njogd2FybmluZzogRXhjZXNzIHN0cnVjdA0KPiBtZW1iZXIgJ3NkJyBkZXNjcmlwdGlvbiBpbiAn
dmlpZl9kZXZpY2UnDQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92
aWlmX2NvbW1vbi5oOjMwOiB3YXJuaW5nOiBGdW5jdGlvbg0KPiBwYXJhbWV0ZXIgb3Igc3RydWN0
IG1lbWJlciAnYmF5ZXJfcGF0dGVybicgbm90IGRlc2NyaWJlZCBpbiAndmlpZl9tYnVzX2Zvcm1h
dCcNCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRpL3ZpaWZfY29tbW9u
Lmg6MzA6IHdhcm5pbmc6IEZ1bmN0aW9uDQo+IHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdp
c19iYXllcicgbm90IGRlc2NyaWJlZCBpbiAndmlpZl9tYnVzX2Zvcm1hdCcNCj4gDQo+IFNob3Vs
ZCBiZSB0cml2aWFsIHRvIGZpeC4NCj4gDQoNCkknbGwgZml4IGtlcm5lbGRvYyBjb21tZW50cy4N
Cg0KDQo+IFJlZ2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCg0KQmVzdCByZWdhcmRzLA0KWXVqaQ0K


