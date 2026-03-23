Return-Path: <linux-media+bounces-56705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEh6Dn8ywWm7RQQAu9opvQ
	(envelope-from <linux-media+bounces-56705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:30:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039F2F1EFA
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDDB43046F1D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1650439EF0B;
	Mon, 23 Mar 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="afxhLXYr"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013087.outbound.protection.outlook.com [52.103.35.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639439D6FC
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268691; cv=fail; b=oyXRasR3srNqfPF1FtIwhWM+VnuxydU/2MzEoCQn++piVd2lBQ39RF+VvLv7IhJA9k9MKBy5H5kWgt6/VhlZprEbErsZEkzw1p4dY1nHw9sszPzF2i2bJaeRUyaUbjIw/8nkQfZQZe2vM53i0HirpL9GmjcHs4MkocMFMIppp4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268691; c=relaxed/simple;
	bh=e83kVgdzOqgGUZLhHplISa2JfroVw4IraR+Tuhj5JtU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E1++b1/+FJfJdFyZahEIK8UiFyHPjvirEcms9uoXXZVB4ZnyoPGMHroiz8RhyvNB+ccJ9Kd8a4HM3yK0Q2Xv68dI3ZIiHj7eFLx17fJOnioQVo00d4nMc3yFYJjAfVJxzAoJ+ciAR7TggPPeLdzABEa9fnEg6/F1ZbKsNnm/eFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=afxhLXYr; arc=fail smtp.client-ip=52.103.35.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYfx2AyLUfbXJPrLeZCM/BG2pVDpQy4HMbjm8eVgrSMNUzb0kerDam0zOq6zZ+xPHF+A6nDlFZ6alCkHTkMSfh/8v9OkwncmA6fOzYV32T42SMjsgFA5vByQ7v0nF28qsWEmp8NiMnuehEDkhzRv06mTOycG5wL/C9EJy5fWtFmr0QBPDr7iwZ2LJT1YrQ7iBobAuIPCjcs70GjSr9BCXtI2S3nKuJQDX8Yi/KCJsK7G4swn5KMGIHu5fVy83rAhEGkDV8D9WPw974jmtG7Y6knzkpT4YO4UgifsnMKIygtG+3lTFXaJ7nvlSLVnt5B4J/lpiXWTtE6n8fx1C1adUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RFQN/0TUwhUg24Xkd22UILINB797YjtQehSCwB5zHU=;
 b=UboDYOCE3wtiZjVU1Ai76ta7FpUmR/1sFIofSqyu7gztOpyxMH0GWc/7Vj8a9Rcze03U0J/1v8eg6H5BsfemdP/OxFuDW4Kcc/TjWd334xpVrWxutsm0CRNj/9atyuTXdBp5ZTkcuDTAE6/iIOyEA1scaL7zUIz9IjAXKhphbCH+KbsTTPq1kP8iOL2RdVwzaqW3l5Tn8dCEaSS4VK8dOAj6z1hqHVLljEnkMjZYp4FMGH2aqOaIZjmfq3MiQKlojZv1ToFo4hLS4y5BMyTDn1zXB39LIfR3ExOwIPl6EqLarmE6AY3qgOJH+rG2ZWLbjlSzQWihaKmuOPwXxt/Wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RFQN/0TUwhUg24Xkd22UILINB797YjtQehSCwB5zHU=;
 b=afxhLXYrONwiGwHhNchnzy3kmkKn5icOZ3eRyEjvQ+5+/CuFLEvxQkehFVS/n/jeZp9oUbqtj+8jbuhJNXTSidxg7GPbjmJb9OZkSPnVKWgVDcOvLjeivvza/jv3RWuW53IF0V5gNSAdcK+l5Xo9DM5JYKlyWOc028WFLBsgwh31G/Sne1mPrrKnAowNqqHgqWE1ziMP1Gt1rQ38gBb2sSRDXY1yBiwanlaPvWw2JWYCcN5wYQoXa4vlhSDw6b5+CGkisMJy2vgogExX9zRzfjwYXF6XI3+Q1PTaGPXEG6Qeau7EqGtXQcI6PscCaN67K/3WTXT8V0wkxTj3pB/JVA==
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:736::6)
 by VI0P190MB2539.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:2cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 12:24:46 +0000
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13]) by AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 12:24:46 +0000
From: Michael Anthony <manthony.nw@outlook.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>
Subject: Re: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Topic: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Index: AQHcuhF0MJVrBbItn0emvC0ds+vfd7W74lQAgAAHpEeAAA5GAIAAEBIQ
Date: Mon, 23 Mar 2026 12:24:46 +0000
Message-ID:
 <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References:
 <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk>
 <AMBP190MB2678DA83087A5C045C0A9FF1ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <177426445884.3376561.13148826876054332090@ping.linuxembedded.co.uk>
In-Reply-To:
 <177426445884.3376561.13148826876054332090@ping.linuxembedded.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP190MB2678:EE_|VI0P190MB2539:EE_
x-ms-office365-filtering-correlation-id: 374d91be-c57e-472c-9eaf-08de88d72bde
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|8062599012|25031999004|8060799015|15030799006|31061999003|15080799012|461199028|19110799012|51005399006|10035399007|3412199025|440099028|4302099013|102099032|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CWTL03KmempJeAi4M0KYToUlc5HBdKvbRa1GXvc0O+hbUL4Kg8D/XJ+Rfn?=
 =?iso-8859-1?Q?LjUd5U3D7h4cVA+QXxY6Q+1jK1kdlaZ/953dAWFfCB8eHu4Spjntf3ymyx?=
 =?iso-8859-1?Q?AXsYmvNukj8pO9m4pFagEXa6pcyzftLtVG6gsz1G5Y7MFZFKHa+Sxw1uhz?=
 =?iso-8859-1?Q?JHeIfOGj+dtf5oI3zLUSHWWqpiiSi5/btJXrHncTYJavlxy9p7r8NmvcVl?=
 =?iso-8859-1?Q?zH/yw8jwCyZjonILW48msxOW62l1vdZT5wvc7hr5f561BrW40N6kzsiKEw?=
 =?iso-8859-1?Q?tDpa+RlvFAzC+9smOvBkppZolG8zLGF9JM+bnLYd66C9nMociHw6ex5D+2?=
 =?iso-8859-1?Q?r304Et8Bf+tPWtYK3qnwjJEIex03/ghPHDj4HRv/oOQwXzdklgGiv0NEmL?=
 =?iso-8859-1?Q?ydE2jesH9p3wDe+ON2iQg4R037/xV2R+d7LUUhz3Aa2QCNtZ6wZL12jBh4?=
 =?iso-8859-1?Q?IOGehohXDVJwUbcO429Puo4sv4oEq4BCoF3uU7XsGkmyEVTYrSvm2lyLvc?=
 =?iso-8859-1?Q?JzNO/PLXq1aEROIGir58fyJNvXIz7SlKI9PayIjZU7LADVdS9NMqGq+QND?=
 =?iso-8859-1?Q?v4i/tLfxkrHv7AFkCCaBDXSSPiemWjHtFJe1pu7LjgdAJ5mKfInZimTZhI?=
 =?iso-8859-1?Q?rTy0Z8pv4gOmsw5J7ImIK789l5k6FN4mMTa9Pyb1jmVJhwPzSR5qBK/dSB?=
 =?iso-8859-1?Q?JOffkaqv8vy+0wt5C7b8jHwGPqzIcHZEk3qwHDARDuobP5jhGBIZC7dxEF?=
 =?iso-8859-1?Q?ybs0K/rXSB+bBsdmeMCYoVzXPdjrlSIw3p0NoDrCikPWu6aRpPWLPOX/3j?=
 =?iso-8859-1?Q?kWi/Nc+2x+awNus4OEB/BifnxsBjJrjo5HQ35BmIP+XRp14CxkcAOqNXza?=
 =?iso-8859-1?Q?Y2QECc4cYbJcuy5MM3e/qdZ7bHvVTOTr6TbUqGMTMk7rLGw1Yg0EEYj22O?=
 =?iso-8859-1?Q?7PRSjkFijsblaeksyaKEH82QP2owLNlD8gZ0Zm1uJ7O2snMg6vRGcMGg7r?=
 =?iso-8859-1?Q?R5ShkstF5xXvxo9TYE7vuPYcpPS/13FmiLcID7S1Vgwrz2XE4+z+Ob0RY+?=
 =?iso-8859-1?Q?fPz3iwT/6pKSiQ3RFTpqROc+BKSe9Qia4Ykf+wbScQwsOWZEkVDI7pI/o7?=
 =?iso-8859-1?Q?Tgq+yDeQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t639GeUd7ERYehYzPBvYAaXjRKClsh57QZHa9XdcwO5BJS2KZfrbD2o1dF?=
 =?iso-8859-1?Q?3DWSvJ+bIqBfIdv65F1LzBr+ZZlNAUzkVk7NUeX/e3YYW73deCNxQ8s5j+?=
 =?iso-8859-1?Q?quB6D1nSRWvwFtpMStqCLjZgrusmopjTzFj1y1W4ZZ2jS3BxKuypHY7Qir?=
 =?iso-8859-1?Q?xQjPlhdaYILYpHluMBCgr9jYdcFHHfoJPDDhp0NRGdxzTkqzhl1XBnXYef?=
 =?iso-8859-1?Q?kxfaRFfxRBkXOMU01guU7i75VkLwd0mbqoYR74pNV5HjddesEGG7fU/lBm?=
 =?iso-8859-1?Q?H+pLfi53ES/6uIcnBP6954xnP+J74+o3OLDlZeJJNtpAr50WV2Gwo/oA1+?=
 =?iso-8859-1?Q?ZaA1q8pDg1xRRsMHnBYjqLUei1H4mKDU2UhigztPzCqubSP6WdNgtrmxiF?=
 =?iso-8859-1?Q?7Tm6I6QjBxNyM4fAwHd/uvyXrgi2izo+OlfmhkVyD42w0H+yNlEyH1/vsn?=
 =?iso-8859-1?Q?heFfDPx7yKyfR2Q7stl5WlfHlYL45QnsFc3nE+R6GSy+ekvtIYCCic2arJ?=
 =?iso-8859-1?Q?74HH3MgX6vrYHx+Hf3bvFnjmi1VtIq40umvkEkszAwZdfLcdm5/XAWU4kk?=
 =?iso-8859-1?Q?lXInKQDKIe4QelS3O6l5Rq9lT3FpUmw67xtPdjFh3s1aGztajSMUaYuYEy?=
 =?iso-8859-1?Q?EvuTNJjjjqkv7IPV2DfHaAbGVRuSRWGsRtJyfqPPUeUNefxjivL4ZZ3Y2r?=
 =?iso-8859-1?Q?4Y/xkjp8AzHV+e6+p0wGfYuYpSIsOWZdWNcAlu494Thw2WUP32zGLjheJ5?=
 =?iso-8859-1?Q?ENAO5VwiOxlcn4eBziIfscz6lQ4UIVaVFZgKMljVlpzJItXHa7l/cd3eR0?=
 =?iso-8859-1?Q?twQ/cI81nPPai3jA2YlUfvomNa4X+5e0UhsVKqRrmrGT21YYtidjfq5dQk?=
 =?iso-8859-1?Q?T76znbwehKpVIBUSjLB85d2yqja6dZbmdLa84i6KVQ7kKno7KH3v4aN/R4?=
 =?iso-8859-1?Q?K6xglsRqj4OLzBFRj7I8KljWddkIEcmJKsi9au/Y19aJPmHVuW2oAha56E?=
 =?iso-8859-1?Q?QHfcxMX0qgR5tC6bnqr72vhEyHcTtPZVcS7kSMUh1tjXyK2cqxcSRMThc2?=
 =?iso-8859-1?Q?AG5yJXXkWCVqRXBYlELkdyDbidNpbl3/EPZQtl7v7zdasVf4T+Ri1AntB+?=
 =?iso-8859-1?Q?GGZibA8U4Gube7YEVeef20w1GTaWlvj99S4DYGicEQY0JrBgCeyTZZQAZI?=
 =?iso-8859-1?Q?BFSIEd3U1IiFOo/Ix0Y8A+iMf0O92NW2pABPutWk0t2xSxoyYQRCgLIT9x?=
 =?iso-8859-1?Q?E0FOM7r2lOwiiOsNh0gmbbsm1SLxVziQxHIdtV3q0l0cHZBW4TNmJTe0oY?=
 =?iso-8859-1?Q?yAgeqOz+111tFrjn5bUsNm4HdR4+mW19++FJCJ1LBWNUdbeMa8rwOxydZA?=
 =?iso-8859-1?Q?+khJmVT0xsg8ry/S44+dfGAypt4XVnjL3VCJ/sizKjdqyw/iE2mVnwWwc/?=
 =?iso-8859-1?Q?pYMa3AGyDtiG/FbqP1a1R2p+1Tsl6vWtO8+4/h2HoU30Ls0PdFtUZILLJ6?=
 =?iso-8859-1?Q?yzBkSazDeKutWL6/kg82Wt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 374d91be-c57e-472c-9eaf-08de88d72bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 12:24:46.7958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P190MB2539
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56705-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manthony.nw@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,outlook.com:dkim,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fedoraproject.org:url,AMBP190MB2678.EURP190.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 9039F2F1EFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kieran,

Thanks for taking the time to look at this and reply to me.  Unfortunately,=
 the next steps are beyond my understanding so I will have to leave it ther=
e.  In case anyone else makes a similar report in the future, I have listed=
 my observations/steps so far below in the hope that they can be of some us=
e.  I have also created a bug report with Fedora.

Since Fedora 40, I have found that the stock fedora and linux-surface kerne=
ls have provided the same funcionality on Surface Go 1 and 2.

The stock fedora and linux-surface kernels 6.17 both provide access to both=
 front and rear cameras following boot.

The stock fedora and linux-surface kernels 6.18 both provide access to the =
front camera and the rear camera starts working if I restart pipewire.

The stock fedora kernel 6.19 shows 'no cameras found'.  I have not been abl=
e to test a linux-surface 6.19 kernel as on their GitHub site, recent attem=
pts to build a 6.19 kernel for Debian, Fedora and Arch have all failed to b=
uild.  The camera patches on the linux-surface github do not appear to have=
 changed since 2021, which is what led me to believe the change that caused=
 the break must be in the upsteam kernel.

Sorry to have wasted your time, but hopefully these observations may be of =
some help with any future reports.

Michael





________________________________________
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Sent: Monday, March 23, 2026 11:14
To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Michael Anth=
ony <manthony.nw@outlook.com>
Cc: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>; mchehab@ke=
rnel.org <mchehab@kernel.org>; hverkuil-cisco@xs4all.nl <hverkuil-cisco@xs4=
all.nl>
Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f85=
4772bd5b breaks camera functionality on Surface Go 2


Hi Michael



Quoting Michael Anthony (2026-03-23 10:38:22)

> Hi Kieran

>

> Sorry about that.  The commit that I suspect caused this regression is:-

>

> 5d505becf75a9696937815ab147e1f2d81165ad8

>

> media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field

>

> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dv6.19.9&id=3D5d505becf75a9696937815ab147e1f2d81165ad8

>

> I am new to this so am not absolutely sure that this is the culprit, but =
it seems to be the only relevant change between 6.18 (working) and 6.19 (no=
t working).

>



If that's the only change and it compiles, then it's not that I'm

afraid.



That change declares it removes an unused variable, and the compiler

should fail if it was actually used.



> NB: I'm not sure if this is relevant but on kernel 6.17 both front and ba=
ck cameras produced an image after booting, but on kernel 6.18 only the fro=
nt camera produced an image and the back camera just showed a green screen =
until I entered systemctl --user restart pipewire in a terminal.  After thi=
s the camera produced a image.  After upgrading to kernel 6.19 in fedora, n=
either camera is detected.

>





You may need to bisect the kernels more preciesly building your own

kernels to use 'git-bisect'.



As  you're on a surface, are you using the linux-surface kernels? They

might have out of tree patches which you've now dropped.



Also - yes, please add a full dmesg and media graphs.



We should try to identify what the actual fault is before we jump

through random kernel configurations.





If the kernels are provided by Fedora - there might be a way to report

to Fedora too.



 - https://docs.fedoraproject.org/en-US/quick-docs/bugzilla-file-a-bug/



suggests

 - https://bugzilla.redhat.com/



--

Kieran





> If you need any more information, please let me know.

>

> Michael

>

>

>

> ________________________________________

> From: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Sent: Monday, March 23, 2026 09:55

> To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Michael An=
thony <manthony.nw@outlook.com>

> Cc: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>; mchehab@=
kernel.org <mchehab@kernel.org>; hverkuil-cisco@xs4all.nl <hverkuil-cisco@x=
s4all.nl>

> Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f=
854772bd5b breaks camera functionality on Surface Go 2

>

>

> Hi Michael,

>

>

>

> Quoting Michael Anthony (2026-03-22 15:40:37)

>

> > Hello,

>

> >

>

> > I am reporting a regression in the IPU3-IMGU driver introduced in the 6=
.19 kernel cycle.

>

> >

>

> > Regression Description:

>

> > Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU=
3 camera on my [Device Model, e.g., Surface Go 2] has stopped functioning. =
While the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcam=
era can no longer initialize the device.

>

> >

>

> > Suspected Commit:

>

> > "media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"

>

> > Commit: a66191c590b3b58eaff05d2277971f854772bd5b

>

> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b

>

> >

>

>

>

> I tried following this link - but it's apparently not the commit you

>

> expect. Can you identify which commit you actually bisected to please?

>

>

>

> --

>

> Kieran

>

>

>

>

>

> > Impact:

>

> > This change seems to have removed a field that libcamera or the V4L2 su=
b-device internal routing relies upon for this specific hardware. Reverting=
 to the 6.18 kernel restores full functionality.

>

> >

>

> > System Information:

>

> >

>

> > Distribution: Fedora 43

>

> >

>

> > Kernel version: 6.19.x (Broken) / 6.18.x (Working)

>

> >

>

> > I can provide dmesg logs if required. Please let me know if you need a =
full media-ctl topology output from the working vs. non-working kernels.

>

> >

>

> > Best regards,

>

> >

>

> > Michael Anthony

>

> >

>


