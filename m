Return-Path: <linux-media+bounces-23521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD19F4069
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F26716D6CA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 02:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDF413AD03;
	Tue, 17 Dec 2024 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="qQkRXWXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1120.securemx.jp [210.130.202.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98042595;
	Tue, 17 Dec 2024 02:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734401485; cv=fail; b=psN8j9FPE7DmCaxQm4LckQdkZr0ljVDdvvR68YvXQj1v5g0Ok3ewYb9P/cu8b8ZB4/KjaNqYKPDlT7KXY/wTsORbtG26ayG9EweOXgjcp59USB9yYBaushY5ZRTrsUGFzn4ynK0PQvpAhOay3amW3C1cI2fdqn6ozCwpQzTDq1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734401485; c=relaxed/simple;
	bh=RIGWKEKaJbIC+xJVSs/Nr7wSyVzcK8KUrZ5CaOTXJJk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ETh5txkwzcRsv/4RCcSZo/HDftcjHhRxRlg7LLEDJGdLJlmQrG4Ar+1Vw+znpwIuWmFgUdyLc/PLiiHWXDdf4PhZI2uzfNK/igQtPGc79VZgOS5yS6LPLmS9ZeZ1n9tYrrFG98rGeH9Hn/dhVMPfoD6234ISOryehUUZ3cKJ6NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=qQkRXWXH; arc=fail smtp.client-ip=210.130.202.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1120) id 4BH03dAQ1950115; Tue, 17 Dec 2024 09:03:39 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1734393782;x=1735603382;bh=RIGWKEKaJbIC+xJVSs/Nr7wSyVzcK8KUrZ5CaOT
	XJJk=;b=qQkRXWXHxGoRWb/I3DYMotbRQxtdi470OkG2mfNGedq9rGHYAyEVZjX2RWSVQXUAtBeMC
	MbgQPEpYjUyWvLKnGCZkVHMQNyCAX30y15gNPT0v6SL6coY5gq8lmOkq/un0/TtB4zRFilE80uIoI
	yynL4Y4od4BtvHf8zUhTFMGejmYSC7NTDx4OGD9/d6sMFHGFbvd7+VYGYwsglhspqK6CK3ZEh90RI
	TYhWNFSpEobNS3CISTxI+H8aq+a67K350d38O8LL4d6LN4uW/FssB4do9CJ/skhwr72Oio6Bfun+7
	Pf4GmNDlVBCuoHcOgLedssyQRIPWrTrBD0EW+IPEHw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 4BH02xUd669298; Tue, 17 Dec 2024 09:02:59 +0900
X-Iguazu-Qid: 2rWhyCKR3DypQZWpAR
X-Iguazu-QSIG: v=2; s=0; t=1734393779; q=2rWhyCKR3DypQZWpAR; m=2xWLCoVFoDwjWRi7CizuuMxOW+JJPTbOvGz70Bgv53o=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1120) id 4BH02vZI1945310
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:02:57 +0900
X-SA-MID: 36387309
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF89TMQCW78DLb+5OmlWH+PHYym/uLcBnfowxKKX4lP5ox8TL2x+BGOMNv+om5OSbSPfY0Zr5k/34c1HEBRGo/2+LOS/tQpFWvo6z6veoJXpoXFuDPYMaGSrVcUL2JZpa8QQSSwHtrwb/Y1xhcV7SReneSjrPzAIuluJEOAejBKP13xu1o5qxKZoO4jxO1Jxla5efH+xPTs9tXX2w3vMSmegBQGqiOO7qW3yzF4vQqErtTIUtmb+Z1GLvrEHe7G9NZqWqHEQ3DAy4toJxV/L3sDXMtAgQvsr0no8Ex1f5DXRVwBPdP79Bs0SoFdXP0pYzbFm/+L4wWdNxAY9oNYuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIGWKEKaJbIC+xJVSs/Nr7wSyVzcK8KUrZ5CaOTXJJk=;
 b=eGEjlD2lgS8vf7iMa8rFv/HzdaWUOwinInJTe+cfk6P7p4VjXT34BL6zWKC+8LKZ2gJkEsihbB0e82lxJcJ5i0cB/12tS7mJs9VeoEmYsGcKMcUZsZYDiTcxVokOhq7Bz1D6mIqlynEnZ4o7xf+1AjfwZDxbGNO1d4KY5Y5UUW8xpcOYfKKBMF7NQxhNzbQT8XDj24nL727QckvlqTdqATI6INPA5bVESkBSsyUWPBfJU0pZjjqRbFsGLdOQHaNFe6bnuzFHfBzQFpAc/A9r7lCqmHWaHsd6epJixgtBCYJDfoKmbxzhBYB/WfEC7nt9pTChh4QxWAyv/PsAfEa2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <krzk@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Topic: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Index: AQHbPxt+FWsXAxpsxEuP88pN+FIWP7LHxoSAgCHmlTA=
Date: Mon, 16 Dec 2024 23:57:49 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
In-Reply-To: <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|OSZPR01MB7129:EE_
x-ms-office365-filtering-correlation-id: 3ecb2ab1-ede4-4b28-9ac3-08dd1e2d7248
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q1pmOWpKQ09DV3lpeDFnNzBSRnc5Z1hDM2g2OWtQUUtNc3NsWnZRVk53V1BI?=
 =?utf-8?B?VCtES2ZHSitFNlhwQzZ6Kzc1cXpweUg3Tkt5aFlSb1lJS1dIbGZ3QkE0SHhR?=
 =?utf-8?B?aHFmVWo4dTdJNWZQMmFoajZ3cnZ6QWhPVEFtd1U2VDRLVE12azdQdkd4MlYr?=
 =?utf-8?B?MHRUUm5pOHloSUJCdUYvZUxrc3VGYlJ4QXlxNlVDMXAxanNOdmxLdmRlQ3o5?=
 =?utf-8?B?OU5hZWsxN3VTZWNuRlNLT3owcEpPeHVIcTY2RDBtUHFDenFYZ0lielNrVWJ5?=
 =?utf-8?B?WDRjb1FhTG9jMTBHYVljVU5HL2c5UjNleW9WZzJ6dUpHNGNHRGxVNm5rYXA3?=
 =?utf-8?B?ZW9TVVNPM3RoSXpzRk13V0V2Q0o4OW13aWVKOXZWRG5WeFpmUmsrQ3lLN3dw?=
 =?utf-8?B?NWQvamw0eWFyV2JaV2xWU3BwUkJuRWxXc3d6bm1xUmEvWUsvcXdocXFCbE00?=
 =?utf-8?B?TEtrdHNjYi9naTg0MGxkMlRlcXlIdFN0bXZXQlRwRFpTWE94OVN1bXVXSGNE?=
 =?utf-8?B?dFN0bTBaR25keE1DVWtydFgyTEVFSjVldktFVWI4MkNNMmlGdzNOZlBhNTU4?=
 =?utf-8?B?L2hsRzQ1ZnBwL2g3WERNQkFoUEV4WjQvbW5tVzNIYlNGREcxdklXcGk5Und5?=
 =?utf-8?B?VjNFTzgvQzR2ditqS3A4UlNiQ01tbUpGa2JkSHZUcnRBZ3Y3T1BoQmh2QnZy?=
 =?utf-8?B?T0NYV0NKLzlwZGRwVXRBYlZvTU00U3RnRm8vOHpybGt5cDBRYncvM2tLUUJh?=
 =?utf-8?B?WmRBeTFveDZFUFNRdWNEKzNEWnFKdjFMSXp0U2xSZkgzbnRNWjZ4QWZnUGJL?=
 =?utf-8?B?VVdlTStabGIrSXlWTHd3ZXFoaE9zWTZnRWhTd2V3Sy9Ub0t6QTkzSkNOemgv?=
 =?utf-8?B?RUZuU3dhT1E2NUVkNEFzZDdQWlBQZmtqamhPNXFtL1hNM0IzQ0ZlelpYZFpu?=
 =?utf-8?B?WHQ2WVJrVDBTdDRZUTErR2djdElhUmZBSzl0U1JoSUtDWWVXc3phOGMrZEVW?=
 =?utf-8?B?VU84OVdISVRGZGEwQ1dZVW9PbzEvZUFOQkxOSFFnYkhuQlhPK2k4UHlrZ3Y0?=
 =?utf-8?B?V1RPajY1UUw0TUhaNS9tTUxWSnZwOUM1N2hhNGRnTnBwZ2ZRVy9VRkQ4YVNW?=
 =?utf-8?B?eitOdmZZblFkM1A2UGd0MzVaRjFxTFlEV1M1WWJkQjRMcm5VN25uLzlxVi9j?=
 =?utf-8?B?YmsraGpNUVJIa2pVRGJOWGJsSWx4TlVkTzFqRnFFZkJISTlHSzFlckhhd2h3?=
 =?utf-8?B?K0FORU90SXFKODExV3JoSW9WelF5SGo1K3k2L1Z1UzFwTkxCMDlwMWYwTjB4?=
 =?utf-8?B?eEszQWVxbnljc2N6eXp5eEhLdEh6Tmc5Z2I5TmJQbnczVkNjdmF4MUcyUmtt?=
 =?utf-8?B?SWRaZHFaMDAySVJWRDgraVhDZUtDa3plVTIvbElQRFV2a1NkVi9FNG5SMEJB?=
 =?utf-8?B?eUkyVHBMWjVwaysrWVVieWpMb1dPMlZ2TjZJSEtweloybFc5VWdmSlQ4QzJ1?=
 =?utf-8?B?ZHA0Sk1kTkw0eXBRWnkrMG9wa3ZrdW1EclN0bHFIcVErS1BtVW1NU0VEeHE3?=
 =?utf-8?B?N1RabjFoUjNSSmdpOFU5QlVqNS9mcThxazl2aGVzb0Vkc01HdnBVV2ZBVkpv?=
 =?utf-8?B?NzhHVlFwbTUzaU1Yc0FnbHdqdDN3OGtTTlAzUnlUL0RTY1l6cWtjckRRcTY0?=
 =?utf-8?B?SlRTWlVuY0ZuWWlyYU1GekhIckxBRVhSaFR5WVlpSXBRMWNncXU2UXFTTzVX?=
 =?utf-8?B?MXBqRzFnY3o3Y1NQbHpkMjhUaW5tWENWeVhPWnN1QmNiKzB2blRxM01zTmQ3?=
 =?utf-8?B?SGdtcHVCUlQ0UnRLYkhKYkJJSkpJQnVGOEhUcXUvS2g0WnVkb0llNEcvTU1w?=
 =?utf-8?Q?f56Qowi8smIER?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWtOMG41aktLd0gvVTF5RjhXWXBtdUxGMlRkdmE1R2VBSm9RYWErOEl4d3hu?=
 =?utf-8?B?cEV1VHhTV3pWT2VyeC9jdkwycjV6bGlvVWJPUHRZZkRBYlBOTnFjVURRa0Z0?=
 =?utf-8?B?ekdoT2xyaGorMUpuRkJITGZTbjNpMEk3b1lSQzhyd2ZhZXRueGF0RjlVVDhi?=
 =?utf-8?B?eHAwaHlmSjdSNjhFRzNoaEtVZGNpVzd0NFl5VEdvVmJUdDlhODlUWnhJZzF6?=
 =?utf-8?B?L2I0RnNzbmE2eUwveExUeGxtemFTeFZ6TG82bnBWbnZxdGlpVC9hSXNDK2dP?=
 =?utf-8?B?dWpNanVGVk9OMTZUcm5mcmZ1eEdOd3JmcmRTRzIwS0Q1b0RueUw4VnFSckNP?=
 =?utf-8?B?dy9lVmQ1YURCa0hYeGVmYXFDSmtvOVpnVHlwTzJoOUMvWFBVdnZFUXIyb0Z0?=
 =?utf-8?B?R2RzNkxab3NscE9KMVVsLzNKM0pMK3U5N29QdkN3dEFKOUQvdCt6dXVQdVpa?=
 =?utf-8?B?MnhZdS9WWGg3V1Q2ZGdhS3VGd1k3TVJvbXhWQlphWFVUNld0aGh3U0ozL0Vr?=
 =?utf-8?B?NjBKWW9iMUZVN1dQMEg4RWVRbkNuOENOOHZKN1g5R2Z4WWdtVThzSE50VHRz?=
 =?utf-8?B?SjdGLzUzNmJhNHhvVVkrd3ZIMU9oZGN3bTJQdDBxZ3QyQytQbVJMbytwdzNL?=
 =?utf-8?B?cGxwNHpsc0xLajJudnZ4VmQzMExVTHpwNUxta0NFVk1ZSWVqVVJtQ2pnNVU5?=
 =?utf-8?B?OHU4Q1N1SCt0Tk1rdzNWWWlZK3NiZlZqNktMa3RIQTF5R3BvSWNETEJxNDhl?=
 =?utf-8?B?QjFjUWpxaXVCcDRaYTBJV0V0TWpzV01lTmhnSmhBYWhjb0RzNkJlckN0U1FK?=
 =?utf-8?B?TE1qb3dXWWVNd2hMbS8vYklSS3lhQnNxR1RQdDNMMWlreTRGWnkyUUI0dGVj?=
 =?utf-8?B?bmdZL0hDOFpqS3VKakdiR3JVRUtaakxjSzE4NVZ4VjVKdXhSVUdwVzd0cUZl?=
 =?utf-8?B?alhZcHVySExnMnZHbVFwSDQvRG54ZWpzQk9nQi9DeStYa2RPMVF0MXg5MW5J?=
 =?utf-8?B?dHlXSlVDRXlKeStSWW9DMHE1QTRmTnY1bTZpZ215ZTEvRGg2Q3lVdUFIc1Ex?=
 =?utf-8?B?NGVWeHl2UWlCV1EvVjhueWxJYTYwVkxmQmkrazI5cUpTRHNCUmpqa3N6QjFO?=
 =?utf-8?B?TjNqT2dNQWM3VmJJVFFGMzF1MEhJKzVKNUxpRERScndiMUowWEs3dVVoNVY1?=
 =?utf-8?B?UzFKQjlCK0NMSENHSk5PdzV6c3QzTGZ6VjNKWDdWcW52T1hBQkF1MGNQUHNB?=
 =?utf-8?B?ZktjQUJUMm9nT2piM25Cbm5Gam92L1FQY0xDZmNKOUJERDZDZzB1K1ZwS0tQ?=
 =?utf-8?B?QzcrdG1MRHpXU3ZRY0lBMVRlUlpDTTcrV0FTcEdiMmwxTkVtT0ZiRDBuVFA4?=
 =?utf-8?B?dHEwaUliMnRhWHhyVTRNQy9zdFB4N0hkOUdBazFXSC9kVHR6N1hodVBRNDlI?=
 =?utf-8?B?UDdjTVNKSW1RckJVQ2lBQVl3TCtKVTdRNlFubkJPd2dReExGbXR0OVFWdm8y?=
 =?utf-8?B?dXBZdFNtQmUreVl4Q0FUcTdqRG5mU3FJYi9WUFRCUnkrZ0pNOXhwV0g5WEhl?=
 =?utf-8?B?MTRJSzVkWEtDRFJrclE3c1BDUGhoYi81Z2tjRjlEZTZpWXlPViswczlWVmtE?=
 =?utf-8?B?LysrQ2xOdmJRcyttb0lvaFhFMnFCeGJjcUpvTGt1djhjQlBFbG4vREF1RHVt?=
 =?utf-8?B?dXQrc2lOYjArMXhKVGRPV3lCTVlqNjVJUGJMN2RoUzdDQzl4Tml4M1Nna3pp?=
 =?utf-8?B?akFWZHNiSnZDeElScTIwVjBNcXFmQ2J0WTNvc0ZjWWRaSXdQRUxQNktXL1Nx?=
 =?utf-8?B?MDNLOTY4R2UyeGRocnJTWXlSdHptNjY2cklXeitEazJGUG4rZ1VGb0lGY1ov?=
 =?utf-8?B?Zy9SSGZaOFVTeGgwMXQwQ3NPS2VmWC93S1hBb1dvS3M2WGNyaldzQmYzN2I5?=
 =?utf-8?B?NG1INitpNGxLK1IxNlF5NWFpQzhqNVB0cWxnaElmUERHUzZwTTM5QzQ1d01m?=
 =?utf-8?B?VUtWT1RaWEh1WVZNTnFPd0hGbmE3YWlFZGc3bEtST1RZcXI5LzJZR3lQNjRx?=
 =?utf-8?B?eGVQY3IybjdaNlR4aGgxOW55VTNiMkRvTHgvSnRCazM0emVrSENERHV1VW9Q?=
 =?utf-8?B?UFpEN1lMUlR2Rld1MDFJRVdTOHNhOUFHR09sZkRYdldoTjdVSGdsTXl6SUY5?=
 =?utf-8?B?U3c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecb2ab1-ede4-4b28-9ac3-08dd1e2d7248
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 23:57:49.5732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0Aw0Kw3X+L7MNK0KC1Iwe1uCmhicLt+UJ5llMgvXWYphb4la1js1BpI2BBl+oHVcWdEaggJ/PUA8pa6aeuhSfPG37HUX3umUxS3ZgPhJbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7129

SGVsbG8gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjUsIDIwMjQgNzoxMSBQTQ0KPiBU
bzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8
o+KXi++8pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+OyBMYXVyZW50
IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBNYXVybyBD
YXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTYWthcmkgQWlsdXMNCj4gPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2Nv
QHhzNGFsbC5ubD47DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4peL77yk77yp
77y077yj4pah77yk77yp77y04peL77yv77yz77y0KQ0KPiA8bm9idWhpcm8xLml3YW1hdHN1QHRv
c2hpYmEuY28uanA+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTIgMS84XSBkdC1iaW5kaW5nczogbWVkaWE6IHBsYXRmb3JtOiB2aXNjb250aTogQWRkDQo+IFRv
c2hpYmEgVmlzY29udGkgTUlQSSBDU0ktMiBSZWNlaXZlcg0KPiANCj4gT24gMjUvMTEvMjAyNCAx
MDoyMSwgWXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiBBZGRzIHRoZSBEZXZpY2UgVHJlZSBiaW5k
aW5nIGRvY3VtZW50YXRpb24gdGhhdCBhbGxvd3MgdG8gZGVzY3JpYmUgdGhlDQo+ID4gTUlQSSBD
U0ktMiBSZWNlaXZlciBmb3VuZCBpbiBUb3NoaWJhIFZpc2NvbnRpIFNvQ3MuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpw
Pg0KPiA+IFJldmlld2VkLWJ5OiBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1
QHRvc2hpYmEuY28uanA+DQo+IA0KPiANCj4gSG93IG5ld2x5IGFkZGVkIHBhdGNoIGNhbiBoYXZl
IGFscmVhZHkgUmIgdGFnPyBXYXMgdGhpcyByZXZpZXcgcmVhbGx5LCByZWFsbHkNCj4gcGVyZm9y
bWVkIGludGVybmFsbHkgb3IgeW91IGp1c3Qgc2F0aXNmeSBzb21lIGludGVybmFsIG1hbmFnZXJz
IHJlcXVpcmVtZW50cw0KPiBhbmQgZmFrZSB0aGUgc3RhdHM/DQo+IA0KDQpJIGFkZGVkIHRoaXMg
UmV2aWV3ZWQtYnkgdGFnIGJlY2F1c2UgdGhlIHBhdGNoIHdhcyByZXZpZXdlZCBpbnRlcm5hbGx5
Lg0KDQo+ID4gLS0tDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjEyOg0KPiA+IC0gTmV3bHkgYWRkIGJp
bmRpbmdzIGZvciBDU0kyUlggZHJpdmVyDQo+ID4NCj4gPiAgLi4uL21lZGlhL3Rvc2hpYmEsdmlz
Y29udGk1LWNzaTJyeC55YW1sICAgICAgIHwgMTA0DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Rvc2hpYmEs
dmlzY29udGk1LWNzaTJyeC55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdG9zaGliYSx2aXNjb250aTUtY3NpMnJ4
LnlhbQ0KPiA+IGwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS90b3NoaWJhLHZpc2NvbnRpNS1jc2kycngueWFtDQo+ID4gbA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41NDg4MDcyYmM4MmENCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3Rvc2hpYmEsdmlzY29udGk1LWNzaTJyeA0KPiA+ICsrKyAueWFtbA0KPiA+IEBAIC0wLDAgKzEs
MTA0IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvdG9zaGliYSx2aXNjb250aTUtY3NpMnJ4Lnlh
bWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IFRvc2hpYmEgVmlzY29udGk1IFNvQyBNSVBJIENT
SS0yIHJlY2VpdmVyDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIE5vYnVoaXJv
IEl3YW1hdHN1IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCj4gPiArDQo+ID4g
K2Rlc2NyaXB0aW9uOiB8LQ0KPiANCj4gRHJvcCB8LQ0KPiANCg0KSSdsbCBkcm9wICJ8LSINCg0K
PiA+ICsgIFRvc2hpYmEgVmlzY29udGk1IFNvQyBNSVBJIENTSS0yIHJlY2VpdmVyIGRldmljZSBy
ZWNlaXZlcyBNSVBJDQo+ID4gKyBDU0ktMiB2aWRlbyAgc3RyZWFtLiBVc2Ugd2l0aCBWSUlGIGRl
dmljZS4gVC5CLkQNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToN
Cj4gPiArICAgIGNvbnN0OiB0b3NoaWJhLHZpc2NvbnRpNS1jc2kycngNCj4gDQo+IFdoeSB0aGlz
IGlzIGNhbGxlZCAiUlgiPyBDYW4geW91IGhhdmUgYSBUWD8gSSBoYWQgaW1wcmVzc2lvbiB0aGF0
IG9uZSBjYW5ub3QuDQo+IA0KDQpWSUlGIGhhcyBvbmx5IE1JUEkgQ1NJMiByZWNlaXZlciAoQ1NJ
MlJYKS4gVGhlcmUncyBubyBUWCBmb3IgaXQuDQpWaXNjb250aSBhbHNvIGhhcyBWT0lGIChWaWRl
byBPdXRwdXQgSW50ZXJmYWNlKSBoYXJkd2FyZSB3aGljaCBoYXMgTUlQSSBDU0kyIChub3QgRFNJ
KSB0cmFuc21pdHRlciAoQ1NJMlRYKS4NCg0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBp
dGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogUmVnaXN0ZXJzIGZvciBDU0kyIHJlY2Vp
dmVyIGNvbnRyb2wNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIGl0ZW1zOg0K
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDU0kyIFJlY2VpdmVyIEludGVycnVwdA0KPiA+ICsN
Cj4gPiArICBwb3J0czoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3Bl
cnRpZXMvcG9ydHMNCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICBwb3J0
QDA6DQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1i
YXNlDQo+ID4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgSW5wdXQgcG9ydCBub2RlLCBzaW5nbGUg
ZW5kcG9pbnQgZGVzY3JpYmluZyB0aGUgQ1NJLTINCj4gdHJhbnNtaXR0ZXIuDQo+ID4gKw0KPiA+
ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICBlbmRwb2ludDoNCj4gPiArICAg
ICAgICAgICAgJHJlZjogdmlkZW8taW50ZXJmYWNlcy55YW1sIw0KPiA+ICsgICAgICAgICAgICB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBwcm9w
ZXJ0aWVzOg0KPiA+ICsgICAgICAgICAgICAgIGRhdGEtbGFuZXM6DQo+ID4gKyAgICAgICAgICAg
ICAgICBkZXNjcmlwdGlvbjogQ1NJMiByZWNlaXZlciBzdXBwb3J0cyAxLCAyLCAzIG9yIDQgZGF0
YSBsYW5lcw0KPiA+ICsgICAgICAgICAgICAgICAgbWluSXRlbXM6IDENCj4gPiArICAgICAgICAg
ICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiAxDQo+ID4gKyAg
ICAgICAgICAgICAgICAgIC0gY29uc3Q6IDINCj4gPiArICAgICAgICAgICAgICAgICAgLSBjb25z
dDogMw0KPiA+ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiA0DQo+ID4gKyAgICAgICAgICAg
IHJlcXVpcmVkOg0KPiA+ICsgICAgICAgICAgICAgIC0gZGF0YS1sYW5lcw0KPiA+ICsNCj4gPiAr
ICAgICAgcG9ydEAxOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3By
b3BlcnRpZXMvcG9ydA0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAg
T3V0cHV0IHBvcnQgbm9kZSwgc2luZ2xlIGVuZHBvaW50IGRlc2NyaWJpbmcgdGhlIFZpc2NvbnRp
IFZJSUYuDQo+ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gcG9ydEAwDQo+
ID4gKyAgICAgIC0gcG9ydEAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBh
dGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gcG9ydHMN
Cj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhh
bXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsNCj4gPiArICAgIHNvYyB7DQo+ID4g
KyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47DQo+ID4gKw0KPiA+ICsgICAgICAgIGNzaTJyeEAxYzAwODAwMCB7DQo+IA0KPiANCj4g
Y3NpQA0KPiANCj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYy4gU2VlIGFsc28gYW4gZXhw
bGFuYXRpb24gYW5kIGxpc3Qgb2YgZXhhbXBsZXMNCj4gKG5vdCBleGhhdXN0aXZlKSBpbiBEVCBz
cGVjaWZpY2F0aW9uOg0KPiBodHRwczovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFkdGhl
ZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2aWNldHJlDQo+IGUtYmFzaWNzLmh0bWwjZ2Vu
ZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlvbg0KPiANCg0KSSdsbCBmaXggdGhlIG5vZGUgbmFtZXMu
DQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg0KQmVzdCByZWdhcmRzLA0K
WXVqaSBJc2hpa2F3YQ0K


