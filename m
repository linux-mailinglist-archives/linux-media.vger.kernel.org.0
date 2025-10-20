Return-Path: <linux-media+bounces-44979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F876BEF72A
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04EC93458DA
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 06:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1C62D6E77;
	Mon, 20 Oct 2025 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Gi1qTP2R"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624F2D2388;
	Mon, 20 Oct 2025 06:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941156; cv=fail; b=BFuj7bz+/uPwWco8QRHiTtt/1LhTLPPPgs/atvIAJTy2dK9hXVAmT7cX8agUNyaf7pkCZcmXZP3w0XlHXOj3YyUFyoZPkpKbgSkQ7F2uaEKOSvXldI6s/Ex2byOnakT8lIa7erYN7sQ6veN7VSc8EDHMkmyz9fNgUarR4bYM/Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941156; c=relaxed/simple;
	bh=Ok2RoGTqSUtUHXeGwXPmLjT8K7/WnXlChX3tmYXbyPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DeNipGSjxTgCuQhRCtKF05BZSQzjKtuFNOpH+nJbFHNZA6xiUKxbuRVAFf+rGxUb0Qy4/av7QMf6WNNqpeoUiiJbqseRW8HR3w1N6DPEM+1/PlQNwlJP07qpEC8iBvJC2dWjzDediWVZKbP5/IB/P4IPDJwrXW/QcFJLhtafvII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Gi1qTP2R; arc=fail smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key1.smx;t=1760941126;x=1762150726;bh=Ok2RoGTqSUtUHXeGwXPmLjT8K7/WnXlChX3tmYX
	byPk=;b=Gi1qTP2RstMCk3yAaBS9GqsLZ7TzsjPV34GaC07TUCq7nshlp46GbRzL0DgqONRnmZNt6
	4dXS1uEg96nfgQp8quGIg++0M/KTGMwE0tTjhYF9859bHKw4Q7EkCDgbJFUIFHMwTUqbd1IyDlP0L
	xhJ3K0LlsXYk76BNPFA700jcecrvesZsRHfZVn+owIhC6kDZiykN8vrJE8eRTX9hAJxW0I23m1p/o
	ho41h6dBhSdLVj5My3sMHDpOU7uTRBv5QG6bQckCicGHytesFMWOEDmXqF8RnNMwz46Gkixp5PCDG
	k14YiMRJJjHQ/OMjP78UJwJQT/6kT2xqR5C/dfHgCQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 59K6IjmH1944740; Mon, 20 Oct 2025 15:18:46 +0900
X-Iguazu-Qid: 2rWhkH031U6TbDsXmY
X-Iguazu-QSIG: v=2; s=0; t=1760941125; q=2rWhkH031U6TbDsXmY; m=JeJB4i/LZkwC1jNreGMAfccTkZ2UIdmjHU8RN9sLDCk=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cqlcP0m4gz4vyk; Mon, 20 Oct 2025 15:18:45 +0900 (JST)
X-SA-MID: 54177585
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq5dI3ZtOdnSpk5I1L9Qc7uf0ySFHg8k/4CfJa9zLXPv5r/pSxY5bR1e7LJGc0dO4qrYVxeffGFHHmsSjIBAJYY1f6swIjsYweXXzZkguZtdXegeindCCT/f15j4eDpmxwZwnAdJOJkjY0d6FSNbVnnDbFJwtMCCeZ1o6zFCsUuv9ONEPGlU4jqDQKxED4R9xiUgGwhKKJq/mu5HJUfVgN9geLseuC30eOIkUa+soW4UznkMS/huwyXkb25onOcNQGeExXyPfSL49p9iW80dDEJWwO6mCSbFXL6lbRvSHT+cWOqS06aE7OM3+EAVQxaeDx2EgucxS7yOEy+UCMF16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KntUXGBF//bHPzSgmx1qynIj80Q0XszvOrzSw2hgJLU=;
 b=mn0S+oMihfh1VIuvyHL9YONRYx4dMGAdrBv3G5liOJ8WaE2SBNJBS0VbTRX6OdxIPKxXj8jJjn+YJRTkARztZPwwymWb7MggUZXgXcu1skTHfX9o++s6T0NrfmqsPVVb9rujLzYuiCWq4r0An0qqHkCTXWG+jIZYkR7a+UMG6kxqo8GIUSZN+Hdtv2cfN45gebE0kY7qGqSxR786xjagUdueJkOkyoNbspdVE9I3UP6f0rk7NG22bpZ924yhr62ISDCUqf+op/PCI+M3xKoR1kp+Un0HbcGQ1FfY4zsukmFhwC41/v38gsbsU8CgI9xFR+aHRf6jzB1du4HYIJeZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <Frank.li@nxp.com>
CC: <nobuhiro.iwamatsu.x90@mail.toshiba>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
 CSI-2 Receiver driver
Thread-Topic: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
 CSI-2 Receiver driver
Thread-Index: AQHcPkQcvdXdeqkQWEO+Ee6SUzi+XLTEMrkAgAZhpdA=
Date: Mon, 20 Oct 2025 06:13:37 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB99823F298F8D9B42981306A192F5A@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-4-ceca656b9194@toshiba.co.jp>
 <aPB4TLK7GMe8OLgP@lizhi-Precision-Tower-5810>
In-Reply-To: <aPB4TLK7GMe8OLgP@lizhi-Precision-Tower-5810>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|TYTPR01MB11067:EE_
x-ms-office365-filtering-correlation-id: 2e72290e-d218-4a7f-4e54-08de0f9fcec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?V2xhV2J6dHVSeTJCYzduR25DQXhRYXFwT0Q5eDlYSVVWRkdjREZxMjZz?=
 =?iso-2022-jp?B?UG9CaHJIOHdTbmg0cGhhQnlLNnQ1L2tCVWRzendBNk1yempIMFloSTBJ?=
 =?iso-2022-jp?B?TWtBR1pHaDJxeDJCZWVYUU1MMDlNRjRhK3NCeTN6QkVPS1hJQ3dRc1lx?=
 =?iso-2022-jp?B?Q2VEb2tIcGRQVWFXK2djZi84NzhUSWdkbE5ReURPRVZ6N1NYNm96NUF5?=
 =?iso-2022-jp?B?eTBTNEF3bk9SZ2gwYUZmVjg5U0pIUzVHb2hlNkNlTHpGT0szQTcvTnVI?=
 =?iso-2022-jp?B?Z3NiVHhybkhrUFc4WkxTd1l4bVhxRkN4VEN5bFBZcXhPTjZSSUVEVUVF?=
 =?iso-2022-jp?B?NlMyQ0tvWXExaUtHRDkvQXNwcFJQbkxJdStNY1JKR0ZLdTdBT2J5c1cv?=
 =?iso-2022-jp?B?WDNmcW9qdVU2ajhnYk8rUjIxZnNOdENhcnI3cDNoNzVHK2hUSVFBRHNk?=
 =?iso-2022-jp?B?NXE2MVAxdU9FTmlMTXAySGlWOFJLN0ZKMlFKZDZIRFVSWVY1amYrOHBY?=
 =?iso-2022-jp?B?c0F5UldoTlRnTmlXSUVDeW45VXE0TmFaQXovbzVCMTh6M2h5a1Q4YWtP?=
 =?iso-2022-jp?B?N3Urckl5SVBTcHdnL0hEbU9jSm1KaTFXaEIrREdYYWRyWnJBRUpNOWFW?=
 =?iso-2022-jp?B?bHcrS2xjbkdDMmpQd2NLenVTcTQxaUxrdjlQL2M1VnlTSyswVU9iZ2xt?=
 =?iso-2022-jp?B?WlZzWHowZW9IZDhoZ0xHaE8yMDMzZStDY0twczVjQVN5dG8wUlB5YzJo?=
 =?iso-2022-jp?B?U1FjUmJRZWtsZ0JxL3c3UjhaZkNsWlNNYm8yb1RMVnk5K2ozSGpXMm16?=
 =?iso-2022-jp?B?RXYySUFFT1pSL21WTGJWbnlMT3k0MzUrVmlyNEhtM0pkR2JFRVdRLzRj?=
 =?iso-2022-jp?B?d0xmSHVxRjlpc3VWNU1mc2JpTGF1M2N0ZW1zbVZ6dkZxbFZLSjFXeVVN?=
 =?iso-2022-jp?B?cjhWRmduVXI2aWNqNGdwV0ZhMXI4YlUvUGJmWW5hT1BGajVRR1kwMnFU?=
 =?iso-2022-jp?B?TUEyS2hxR1J4VEZ3ZFo1dzRxKzZmUnRjRmh3bzhrUktYdU5iUlpUYURi?=
 =?iso-2022-jp?B?RlRyR3VxUzhwK1ZxLzBONmNpVEYxaDRUYTZRSFRVKzc5YkJPR3RISUU3?=
 =?iso-2022-jp?B?LzBIRkdDaW5OWGMvSHpKRzc5TXhpR2RVazBrRHkxVlpSTVh4a2xGN25U?=
 =?iso-2022-jp?B?RUVoVXVPYzJhRUdRN0cwOUN3TmxYdHZFUjg2a1JVbVV5dnEvNWphZld4?=
 =?iso-2022-jp?B?RUwwM1A2aGxOcmtsL3RkdnpqaUNvRWxXMGF1d0ExQkdmTlVYSERIZVls?=
 =?iso-2022-jp?B?b3luRHNHZkYxM2c3TXBZZzRzai9VVWF5ZXZSYTJEclFRU05WcWdaWUxR?=
 =?iso-2022-jp?B?WGlheXZ2VUp4anIrOGlyeE1BUFZxdVNLanNTQzVqZWxmMmE4dis3bnFr?=
 =?iso-2022-jp?B?NE8rOEdjUTB5WTY3eDJkQ2pVeHhKVklrL0RKcDNNZjFaTVRLVlNEaml4?=
 =?iso-2022-jp?B?c0NFL3pwZmVVaE1YL3MwWUhvamFpRFNNbXdOU0pxMTVhWTF6MFNBY0Q1?=
 =?iso-2022-jp?B?RytEMmlaS1doMmN4UHlqZThkdW5RRmdTZmNzek53eDk4Q01LeVQ4czZn?=
 =?iso-2022-jp?B?c2xBZXhuMXFOZDk4RlpzZXZXaUZlVFQvNUgraVpwMlFoc3N0QzBuSEUr?=
 =?iso-2022-jp?B?K1FRbHhzR29SQnk2dmFGUkQvTDVWUExtdFgxMnZzejNZMU5RY0xIaG5a?=
 =?iso-2022-jp?B?aGlKb2l5MVVzcVhjUm5MRVJOcHdBUzJaaWhkMzlidFI2MnEvSW8vMjRi?=
 =?iso-2022-jp?B?ZkdVQldiRG5BOHhDZGdOVWxpZWc4dU11UVNSVEtpeE15ZEtBdU9KZmZK?=
 =?iso-2022-jp?B?U3krQ2hseDZxM0xCMkNOQ1RMZkJkVVBwMXpBVmNJdXZMSm9FdjV2aXNx?=
 =?iso-2022-jp?B?RW0zUURmcnBvL1Y2bnRoL0ZlT0lTbDQ1d2FleWQwZW5IYk9pT3RtMWxE?=
 =?iso-2022-jp?B?aVZyZVVDenI4RzhMRktwVUc2Ty92c09qaG5KTW1vbXI4MEg5UGc4QWVY?=
 =?iso-2022-jp?B?Q1NyajF6eTc4clBPSHh6SnliejczMm9nQ2ZJNHRzb0FnUThydVBWUEti?=
 =?iso-2022-jp?B?K3JRUjdVU2VBNklxT3E1UVljanZFaEdGcTY3Z1IzWnFSSWJ0K2V0akF6?=
 =?iso-2022-jp?B?Yzd4SmxEeDBWMk9WRVBqbUtCTllZZjYx?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?b0MweEZ1ZE9HSFhSMm1xazlabldFTVl1alhwVFpCNWgvZERZd1hCbVVn?=
 =?iso-2022-jp?B?VmZvdDFZTzNuTVEzNW9SdFIwNTZVK3dPdGxjNW5GVTlXNEx0UUhQMjR0?=
 =?iso-2022-jp?B?cFpzV1Rwak43aXZtcmRUN0hsZjdpcHRlV05UK0hmZ01uM0hBZmVYeDRS?=
 =?iso-2022-jp?B?NEVEOVBjN0ZzTHVWUzhwaHphQWRJMkowMXRpcU92Rmt5SjYxa0VTbklu?=
 =?iso-2022-jp?B?VVdOVHFSOUdhb1Y0TUpTallLRjdYOWdFSjdjL0wydXVyNkdaL1RSWThB?=
 =?iso-2022-jp?B?TytuTk03ZjJjUFhWSk92WEpySlJzYSsyUjIzMzU2aFphd0J0bkNOK2lZ?=
 =?iso-2022-jp?B?SzZMMmZtaXRuOFYwS3NsYVRwQ2xqNjQzUGlXU2JyNUtwcXk1NXhEYzlB?=
 =?iso-2022-jp?B?aFd5akc1NmdZR2ZRSFhJajdhZEFON0ZIejZHZ291d291QjNTaXBOSzFD?=
 =?iso-2022-jp?B?dXBwVmtObG9YQmlXeEtnYm5naGJRaEFlcXNBcUQ5ZG5JeG9RRGk0L2oz?=
 =?iso-2022-jp?B?N2h0YVJhdDlGeTc0c0VqS0g4eUZXOE5WcWZaZEErMU1tTk5DbjM3TzZ1?=
 =?iso-2022-jp?B?ZEo1MDV1U3pDKzNvbDhXNGI5eUVsajFiek5tM3Yzd3FoK3JWeUJSSkV0?=
 =?iso-2022-jp?B?MUQxMElER3FtNUVYTHdNS3VZVXhwcXNndGxiQ1J1RjhMVTh1SzIrbHhS?=
 =?iso-2022-jp?B?V2JkNTFkQmhiTmVoNG5HVnFMQkZMQzdnQnFESEl4VkZGVVpHdW4wVVVW?=
 =?iso-2022-jp?B?V01LeVFlSG9VYWkwZjY2bGJIc0lpckJZN09jK1F2UFJrdEtFeUFYNHlG?=
 =?iso-2022-jp?B?TDNsdTdPYWRnUHBZdEhyNXBrUGcxS1E2N1lVaHFBenNhQ1FneXI0am4z?=
 =?iso-2022-jp?B?c1JUNGdHSmFqSi96bDVxVWRwaCsza2R3d0ZHVzdveTZQeU52YUtEUS9H?=
 =?iso-2022-jp?B?bGgyaWpmNi9mb3ZnSmlUMFBLMTM5dnBYK3FjYTk3U1lwYWMwNWsyREJn?=
 =?iso-2022-jp?B?djRuc1F2dFJ5a3VWOHpnYTZkSjEwVWk4YzBNaEw5YlROenJxZUlMRWV4?=
 =?iso-2022-jp?B?allZcEJvblMwV09UK2MxUzBBb2NQUkdqcU5CampFV0ZrRUhrUDg3OWZU?=
 =?iso-2022-jp?B?N0ltNHFWVk9MTUdNNmNSbjM0RXo5Szl3RmFyN0p0YTA5ZXlna3F3Umxn?=
 =?iso-2022-jp?B?eTFLVTFFVVczQVpQb0FGYW93ejI1Vll4TGFtdVltNWx4clNIM0NQRFY4?=
 =?iso-2022-jp?B?aTRjVVdEL0RSQWNQcUxoYkpONUhkR0IvUWY5TkNLaCtvYWJnckxJQmE2?=
 =?iso-2022-jp?B?aU02NUJZU1hTMmNFbjNneFBMbEZqV2I1aUVJcHJ5UmdIekRjTGRoQWRD?=
 =?iso-2022-jp?B?VHh3MklINDRYYkE1SVlISHFwdHRobk9OY1h4Q0tiTGgrTXg2NTRqY0lo?=
 =?iso-2022-jp?B?ZWhrV2Y5VkNRbVlQbklBbU93V3JQNWE1d2ZsU3dvZ2VKL042cnNVY0lC?=
 =?iso-2022-jp?B?RUN3TUVFamt3andQNllzNUorV1ZGOVRXejFGdnhMUzFSQy9RTGluUmN5?=
 =?iso-2022-jp?B?bEdRRnlpZlNzR2R0bXkrN3UwL1hNMG9xbWRGWFhsL2NOVkw4ZUtqblNW?=
 =?iso-2022-jp?B?TXY4VUtOdFQ4aW9kUnM3MkZDZkt6T2R3akN0LzFUelozMmNIYlFtclNy?=
 =?iso-2022-jp?B?MFd3alBFY3FRNnpoLzdPRHJMUUJVRXVCZTNTQ3hGQVo4dk1JNUh3c0E5?=
 =?iso-2022-jp?B?OWhTMVJySmdsRGRBVHB0QmdzZUgwcmJGR2Q1OVVmWlNlM0JtdElaOTN0?=
 =?iso-2022-jp?B?Q1R3S1B1UjRybGR4OXVTaGk3eFRJb253YVkraE9ybHFkbXdDQmlQYmJ5?=
 =?iso-2022-jp?B?VmhWRGVqamhBTEcwL0hHVTRvTGUycEUrblNNQkY3dWRqZzZLMks1NnVV?=
 =?iso-2022-jp?B?VEdSMGRYYXdUZEpDNm1POEhWeFJueXJJbUZpWXhuMUJualZwaHczby8v?=
 =?iso-2022-jp?B?YXN3QitGUmo4dElhcFhueTQrZWZ3NU1aSnRmMFRTY1pqNENQbTU4bjF3?=
 =?iso-2022-jp?B?eWxMaklwU1ByZ1F5T3piNlFqRTFVRW5Ka0J2TUtNS1FUTWhZQkFxcExo?=
 =?iso-2022-jp?B?NmVBV2s3d3lRdWkrdGJhZGx0UUdqSmpJbFoyek1iMXNvSWs0NWVYUEhF?=
 =?iso-2022-jp?B?VWVOOWxaNUw1RldvS0pEOTk4NkowaEd1WGpWNWJkTG9iVzlBWDBGUkNj?=
 =?iso-2022-jp?B?dTlEV2txN0tDaDQySmptcGZncG9xWllvRDFrSUF1eldEZ2Uva0QvMklk?=
 =?iso-2022-jp?B?UUtxcm5Ydlg5TVRWTFoyK0tRRU9UZ0VPaXc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e72290e-d218-4a7f-4e54-08de0f9fcec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:13:37.5656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8xP5JPIYmWYPxDdoE+68skmWO/J5TSofRyKepKuLQ2vSMb0vw8nhvj+Pcflw7uN16QqrHcIBpdUJjySV9Jm503118XeY3QTSII0lpq04mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11067

Hello Frank,

Thank you for review comments.

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Thursday, October 16, 2025 1:45 PM
> To: ishikawa yuji(=1B$B@P@n=1B(B =1B$BM*;J=1B(B =1B$B""#A#I#D#C!{#E#A3+=
=1B(B)
> <yuji2.ishikawa@toshiba.co.jp>
> Cc: iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=1B(B =1B$B""#D#I#T#C!{#C#P=
#T=1B(B)
> <nobuhiro.iwamatsu.x90@mail.toshiba>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visco=
nti
> CSI-2 Receiver driver
>=20
> On Thu, Oct 16, 2025 at 11:24:41AM +0900, Yuji Ishikawa wrote:
> > Add support to MIPI CSI-2 Receiver on Toshiba Visconti ARM SoCs.
> > This driver is used with Visconti Video Input Interface driver.
> >
> > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > ---
> > Changelog v12:
> > - Separate CSI2RX driver and made it independent driver
> > - viif_csi2rx subdevice driver (in v11 patch) was removed.
> > - dictionary order at Kconfig and Makefile
> >
> > Changelog v13:
> > - wrap one line at 80 characters
> > - change banner comment style
> > - update comment style; spacing at the start and end, capitalize first
> > letter
> > - add support for clock and reset framework
> > - add debugfs to pass debug and status information
> > - add entries to MAINTAINERS file
> > - Kconfig: add a blank line just after License Identifier.
> > - update references to header files
> > - remove redundant inline qualifier
> > - shorten function/variable names: visconti_csi2rx -> viscsi2
> > - simplify dphy_write and dphy read operations
> > - remove osc_freq_target from struct csi2rx_dphy_hs_info, which is alwa=
ys
> the same value.
> > - add comment about MASK register's behavior (reversed polarity)
> > - use v4l2_get_link_freq() instead of get_pixelclock()
> > - set driver name according to module name: visconti_csi2rx_dev ->
> > visconti-csi2rx
> > - check error before setting priv->irq in probe()
> > - check error at fmt_for_mbus_code()
> > - add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
> > - improve viscsi2_parse_dt() by assuming bus_type is CSI2_DPHY
> > - use dev_err_ratelimited() for irq handler
> > - bugfix on fmt_for_mbus_code(): in case unsupported mbus_code is
> > given
> > - add goto based error handling sequence to viscsi2_parse_dt()
> > - specify default value of colorspace, ycbcr_enc, quantization and
> > xfer_func of sink/src_fmt
> > - specify sensor at enable_streams() using previously set ID, instead
> > of checking remote pad every time
> > - remove U suffix on numeric value
> > - use unsigned int variable for loop index
> > - remove redundant casting
> > - use GENMASK instead of literal
> > - remove unused constants
> > - remove unused visconti_csi2rx_video_ops
> > ---
> >  MAINTAINERS                                        |   1 +
> >  drivers/media/platform/Kconfig                     |   1 +
> >  drivers/media/platform/Makefile                    |   1 +
> >  drivers/media/platform/toshiba/Kconfig             |   6 +
> >  drivers/media/platform/toshiba/Makefile            |   3 +
> >  drivers/media/platform/toshiba/visconti/Kconfig    |  17 +
> >  drivers/media/platform/toshiba/visconti/Makefile   |   8 +
> >  .../media/platform/toshiba/visconti/csi2rx_drv.c   | 954
> +++++++++++++++++++++
> >  8 files changed, 991 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > c17c7ddba5af..ce973791b367 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25986,6 +25986,7 @@ L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:
> 	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.ya
> ml
> >  F:
> 	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yam
> l
> > +F:	drivers/media/platform/toshiba/visconti/
> >
> >  TOSHIBA WMI HOTKEYS DRIVER
> >  M:	Azael Avalos <coproscefalo@gmail.com>
> > diff --git a/drivers/media/platform/Kconfig
> > b/drivers/media/platform/Kconfig index 9287faafdce5..d5265aa16c88
> > 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -87,6 +87,7 @@ source "drivers/media/platform/st/Kconfig"
> >  source "drivers/media/platform/sunxi/Kconfig"
> >  source "drivers/media/platform/synopsys/Kconfig"
> >  source "drivers/media/platform/ti/Kconfig"
> > +source "drivers/media/platform/toshiba/Kconfig"
> >  source "drivers/media/platform/verisilicon/Kconfig"
> >  source "drivers/media/platform/via/Kconfig"
> >  source "drivers/media/platform/xilinx/Kconfig"
> > diff --git a/drivers/media/platform/Makefile
> > b/drivers/media/platform/Makefile index 6fd7db0541c7..09e67ecb9559
> > 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -30,6 +30,7 @@ obj-y +=3D st/
> >  obj-y +=3D sunxi/
> >  obj-y +=3D synopsys/
> >  obj-y +=3D ti/
> > +obj-y +=3D toshiba/
> >  obj-y +=3D verisilicon/
> >  obj-y +=3D via/
> >  obj-y +=3D xilinx/
> > diff --git a/drivers/media/platform/toshiba/Kconfig
> > b/drivers/media/platform/toshiba/Kconfig
> > new file mode 100644
> > index 000000000000..f02983f4fc97
> > --- /dev/null
> > +++ b/drivers/media/platform/toshiba/Kconfig
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +comment "Toshiba media platform drivers"
> > +
> > +source "drivers/media/platform/toshiba/visconti/Kconfig"
> > +
> > diff --git a/drivers/media/platform/toshiba/Makefile
> > b/drivers/media/platform/toshiba/Makefile
> > new file mode 100644
> > index 000000000000..dd89a9a35704
> > --- /dev/null
> > +++ b/drivers/media/platform/toshiba/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-y +=3D visconti/
> > diff --git a/drivers/media/platform/toshiba/visconti/Kconfig
> > b/drivers/media/platform/toshiba/visconti/Kconfig
> > new file mode 100644
> > index 000000000000..aa0b63f9f008
> > --- /dev/null
> > +++ b/drivers/media/platform/toshiba/visconti/Kconfig
> > @@ -0,0 +1,17 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config VIDEO_VISCONTI_CSI2RX
> > +	tristate "Visconti MIPI CSI-2 Receiver driver"
> > +	depends on V4L_PLATFORM_DRIVERS
> > +	depends on VIDEO_DEV && OF
> > +	depends on ARCH_VISCONTI || COMPILE_TEST
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> > +	help
> > +	  Support for Toshiba Visconti MIPI CSI-2 receiver,
> > +	  which is used with Visconti Camera Interface driver.
> > +
> > +	  This driver yields 1 subdevice node for a hardware instance.
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called visconti-csi2rx.
> > diff --git a/drivers/media/platform/toshiba/visconti/Makefile
> > b/drivers/media/platform/toshiba/visconti/Makefile
> > new file mode 100644
> > index 000000000000..62a029376134
> > --- /dev/null
> > +++ b/drivers/media/platform/toshiba/visconti/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for the Visconti video input device driver #
> > +
> > +visconti-csi2rx-objs =3D csi2rx_drv.o
> > +
> > +obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) +=3D visconti-csi2rx.o
> > diff --git a/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > new file mode 100644
> > index 000000000000..53d112432a86
> > --- /dev/null
> > +++ b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> > @@ -0,0 +1,954 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > +/*
> > + * Toshiba Visconti Video Capture Support
> > + *
> > + * (C) Copyright 2025 TOSHIBA CORPORATION
> > + * (C) Copyright 2025 Toshiba Electronic Devices & Storage
> > +Corporation  */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/reset.h>
> > +#include <linux/seq_file.h>
> > +
> > +#include <media/mipi-csi2.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +/* CSI2HOST register space */
> > +#define REG_CSI2RX_NLANES	 0x4
> > +#define REG_CSI2RX_RESETN	 0x8
> > +#define REG_CSI2RX_INT_ST_MAIN	 0xc
> > +#define REG_CSI2RX_DATA_IDS_1	 0x10
> > +#define REG_CSI2RX_DATA_IDS_2	 0x14
> > +#define REG_CSI2RX_PHY_SHUTDOWNZ 0x40
> > +#define REG_CSI2RX_PHY_RSTZ	 0x44
> > +
> > +/* Access to dphy external registers */ #define
> > +REG_CSI2RX_PHY_TESTCTRL0 0x50
> > +#define BIT_TESTCTRL0_CLK_0	 0
> > +#define BIT_TESTCTRL0_CLK_1	 BIT(1)
> > +
> > +#define REG_CSI2RX_PHY_TESTCTRL1 0x54
> > +#define BIT_TESTCTRL1_ADDR	 BIT(16)
> > +#define MASK_TESTCTRL1_DOUT	 GENMASK(15, 8)
> > +
> > +#define REG_CSI2RX_INT_ST_PHY_FATAL  0xe0 #define
> > +REG_CSI2RX_INT_MSK_PHY_FATAL 0xe4
> > +#define MASK_PHY_FATAL_ALL	     0x0000000f
> > +
> > +#define REG_CSI2RX_INT_ST_PKT_FATAL  0xf0 #define
> > +REG_CSI2RX_INT_MSK_PKT_FATAL 0xf4
> > +#define MASK_PKT_FATAL_ALL	     0x0001000f
> > +
> > +#define REG_CSI2RX_INT_ST_FRAME_FATAL  0x100 #define
> > +REG_CSI2RX_INT_MSK_FRAME_FATAL 0x104
> > +#define MASK_FRAME_FATAL_ALL	       0x000f0f0f
> > +
> > +#define REG_CSI2RX_INT_ST_PHY  0x110
> > +#define REG_CSI2RX_INT_MSK_PHY 0x114
> > +#define MASK_PHY_ERROR_ALL     0x000f000f
> > +
> > +#define REG_CSI2RX_INT_ST_PKT  0x120
> > +#define REG_CSI2RX_INT_MSK_PKT 0x124
> > +#define MASK_PKT_ERROR_ALL     0x000f000f
> > +
> > +#define REG_CSI2RX_INT_ST_LINE	0x130
> > +#define REG_CSI2RX_INT_MSK_LINE 0x134
> > +#define MASK_LINE_ERROR_ALL	0x00ff00ff
>=20
>=20
> Look like it is dwc CSI2RX controller. Can we work out a common dwc CSI2R=
X
> driver to avoid every duplicate the same code
>=20
> A attempt at
> https://lore.kernel.org/imx/20250821-95_cam-v3-20-c9286fbb34b9@nxp.com
> /
>=20
> The above is the base on stage's imx6. we try to find a path to workout a
> common dwc csi2rx.
>=20
> Frank
>=20

Yes, it is DWC CSI2RX controller.
It's an interesting idea to have a common dwc driver.
Let me check if CSI2RX and PHY drivers work well with Visconti's hardware.
Please let me know the base repository to apply patches.

Regards,
Yuji Ishikawa


