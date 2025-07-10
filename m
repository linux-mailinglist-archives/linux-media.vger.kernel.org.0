Return-Path: <linux-media+bounces-37428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6EB00DB5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349D35C3105
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBC22FE320;
	Thu, 10 Jul 2025 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lab126.com header.i=@lab126.com header.b="TmikW2L3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3223506E;
	Thu, 10 Jul 2025 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182693; cv=none; b=UOkoRJD9veVBumHJiJ3PnZKORpluRXAbrF16OyXR9+/fiyOF03SzK/L30dgM+MGoZ6IQjocoHq51AgpyaTwsmm4X9atUYatUmgCfSvJbMvmGJ/DDR8kuyq93T7aHmhf8zr6jJGmSXQ5ijNztOCk4zId5ysMX8hjMZ6AT5bXIVnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182693; c=relaxed/simple;
	bh=m196OWchbWueVdD11g+jM9pmu4/xEi1RHjhlGGs8aO0=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=khXtXmb012iNfqZOIVVFN3+8w5owcj/5xH/PD5PWOJBC63O8BDKBouYi7b4ACoOom3+AUKyCnMq/pMe+YyYqeKbTqSVvP+pcrklkVhi1IRWUKE7R63J6TATUBJynhOdtUmhWi3yugqgF8MlaHIUDUrYsBYWgDjCDPzpHBCLyBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lab126.com; spf=pass smtp.mailfrom=lab126.com; dkim=pass (2048-bit key) header.d=lab126.com header.i=@lab126.com header.b=TmikW2L3; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lab126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lab126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=lab126.com; i=@lab126.com; q=dns/txt; s=amazoncorp2;
  t=1752182691; x=1783718691;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=m196OWchbWueVdD11g+jM9pmu4/xEi1RHjhlGGs8aO0=;
  b=TmikW2L3ZOj69nZSefn/rHkblhfwuqnPnDsJnmB5PXFOAYSjgkt444wy
   /naYgLyI1zHn492i20+0w4dNlz9WUY2ouzH8C0USvZfSj09yfqalwb+Ll
   su2PhcmED8E05fhGKBWCl47ZbJfGDQbBpU8xALDS9gEMJ59Y9GE1I46aA
   G4TmcLb6LaCuImHQuiXQPTaVpuSgqLGg28Tw5uK8cdYrK/4b9jHqjyiNg
   nPDpRcqXiDY/XmLso/gkfU8Vcl4DOjHggFul9/vVyNI7pNI1X+Rp6gHTw
   +AnN9YtWdAMqB6cw5B12xtu2xDHewLaoA/ejqPbjr12ycubMoMR696mIh
   Q==;
X-IronPort-AV: E=Sophos;i="6.16,301,1744070400"; 
   d="scan'208";a="740692732"
Subject: Re: [PATCH v2 2/2] phy: dw-dphy-rx: Add dt bindings for Synopsys MIPI D-PHY
 RX
Thread-Topic: [PATCH v2 2/2] phy: dw-dphy-rx: Add dt bindings for Synopsys MIPI D-PHY RX
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 21:24:49 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:22081]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.152:2525] with esmtp (Farcaster)
 id 65832b67-ae7b-4fb9-99e5-2c3b935aa38d; Thu, 10 Jul 2025 21:24:48 +0000 (UTC)
X-Farcaster-Flow-ID: 65832b67-ae7b-4fb9-99e5-2c3b935aa38d
Received: from EX19D017UWC001.ant.amazon.com (10.13.139.243) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 10 Jul 2025 21:24:47 +0000
Received: from EX19D007UWB001.ant.amazon.com (10.13.138.75) by
 EX19D017UWC001.ant.amazon.com (10.13.139.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 10 Jul 2025 21:24:47 +0000
Received: from EX19D007UWB001.ant.amazon.com ([fe80::8bac:775b:fb7b:f4c0]) by
 EX19D007UWB001.ant.amazon.com ([fe80::8bac:775b:fb7b:f4c0%6]) with mapi id
 15.02.1544.014; Thu, 10 Jul 2025 21:24:47 +0000
From: "Poduval, Karthik" <kpoduval@lab126.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Xiong, Jason" <jyxiong@amazon.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Anish Kumar, FNU" <anishkmr@amazon.com>,
	"miguel.lopes@synopsys.com" <miguel.lopes@synopsys.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Thread-Index: AQHb8WvE82M5mfLan0qPx7x81bjHGrQr30YA
Date: Thu, 10 Jul 2025 21:24:47 +0000
Message-ID: <1c135aa4989f7a49cc58a092986e27712210d662.camel@lab126.com>
References: <cover.1752106239.git.kpoduval@lab126.com>
	 <7f4b676678b27ea91314c834a297c1e057959b09.1752106239.git.kpoduval@lab126.com>
	 <20250710-dainty-tarsier-from-hyperborea-ecf9d3@krzk-bin>
In-Reply-To: <20250710-dainty-tarsier-from-hyperborea-ecf9d3@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F354D6A01492945B93108A8B6A5AFFF@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

DQpIaSBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KT24gVGh1LCAy
MDI1LTA3LTEwIGF0IDA5OjI0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBD
QVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6
YXRpb24uIERvDQo+IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlcg0KPiBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KPiANCj4gDQo+IA0KPiBPbiBXZWQsIEp1bCAwOSwgMjAyNSBhdCAwNzo0MjoyMVBNIC0wNzAw
LCBLYXJ0aGlrIFBvZHV2YWwgd3JvdGU6DQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3BoeS9zbnBzLGR3LWRwaHktcngueWFtbCMNCj4gDQo+IEZpbGVu
YW1lIGFuZCBpZCBzaG91bGQgbWF0Y2ggY29tcGF0aWJsZS4NCj4gDQo+ID4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiAr
dGl0bGU6IFN5bm9wc3lzIERlc2lnbndhcmUgTUlQSSBELVBIWSBSWA0KPiA+ICsNCj4gPiArbWFp
bnRhaW5lcnM6DQo+ID4gK8KgIC0gS2FydGhpayBQb2R1dmFsIDxrcG9kdXZhbEBsYWIxMjYuY29t
Pg0KPiA+ICvCoCAtIEphc29uIFhpb25nIDxqeXhpb25nQGFtYXpvbi5jb20+DQo+ID4gK8KgIC0g
TWlndWVsIExvcGVzIDxtaWd1ZWwubG9wZXNAc3lub3BzeXMuY29tDQo+ID4gKw0KPiA+ICtkZXNj
cmlwdGlvbjogfA0KPiA+ICvCoCBUaGVzZSBhcmUgdGhlIGJpbmRpbmdzIGZvciBTeW5vcHN5cyBE
ZXNpZ253YXJlIE1JUEkgRFBIWSBSWCBwaHkNCj4gPiBkcml2ZXIuDQo+ID4gK8KgIEN1cnJlbnRs
eSBvbmx5IHN1cHBvcnRlZCBwaHkgdmVyc2lvbiBpcyB2MS4yLg0KPiA+ICsNCj4gPiArcHJvcGVy
dGllczoNCj4gPiArwqAgY29tcGF0aWJsZToNCj4gPiArwqDCoMKgIGNvbnN0OiBzbnBzLGR3LWRw
aHktMXAyDQo+IA0KPiBZb3Ugc2hvdWxkIHJhdGhlciB1c2UgU29DIGNvbXBhdGlibGVzLg0KSWYg
c2ltaWxhciBTeW5vcHN5cyBELVBIWSBpcyB1c2VkIGluIG11bHRpcGxlIFNvQ3Mgd2l0aCBzbGln
aHQNCnZhcmlhdGlvbnMsIHNob3VsZCBlYWNoIFNvQyBoYXZlIGl0cyBvd24gRC1QSFkgZHJpdmVy
IG9yIGlzIGl0IGJldHRlcg0KdG8gaGF2ZSBhIGNvbW1vbiBvbmUgdGhhdCB3b3JrcyBmb3IgYWxs
IFNvQ3MgbGlrZSBhcm0sc21tdS12MyBvciBsaWtlDQp0aGUgRUVQUk9NIGRyaXZlciBiZWxvdyA/
wqANCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvbWlzYy9lZXByb20vZWVwcm9tXzkzeHg0Ni5jP2g9
djYuMTYtcmM1I24zOTENCndoZXJlIGRyaXZlciBzcGVjaWZpYyBkcml2ZXJfZGF0YSBjb3VsZCBz
dXBwb3J0IG11bHRpcGxlIHZlcnNpb25zIG9yDQpTb0MgdmFyaWF0aW9ucy4gDQpPdXIgdGVhbSB0
aG91Z2h0IG9mIHRoZSBjb21tb24gZHJpdmVyIGFwcHJvYWNoIGhvd2V2ZXIgbG9va2luZyBmb3IN
CmdlbmVyYWwgZ3VpZGFuY2UgZnJvbSBQSFkgc3Vic3lzdGVtIG1haW50YWluZXJzIGFuZCBjb250
cmlidXRvcnMuDQo+IA0KPiA+ICsNCj4gPiArwqAgJyNwaHktY2VsbHMnOg0KPiA+ICvCoMKgwqAg
Y29uc3Q6IDANCj4gPiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1pbkl0ZW1zOiAyDQo+
ID4gK8KgwqDCoCBtYXhJdGVtczogMg0KPiANCj4gTGlzdCB0aGUgaXRlbXMgaW5zdGVhZA0KPiAN
Cj4gQW5kIGZpeCB0aGUgb3JkZXIsIHJlZyBnb2VzIHNlY29uZC4NCmFjaw0KPiANCj4gPiArDQo+
ID4gK3JlcXVpcmVkOg0KPiA+ICvCoCAtIGNvbXBhdGlibGUNCj4gPiArwqAgLSAnI3BoeS1jZWxs
cycNCj4gPiArwqAgLSByZWcNCj4gDQo+IEhlcmUgYXMgd2VsbA0KYWNrDQo+IA0KPiA+ICsNCj4g
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4g
PiArwqAgLSB8DQo+ID4gK8KgwqDCoCBkd19kcGh5X3J4OiBkdy1kcGh5QDkwMDAwMDA0MCB7DQo+
IA0KPiBwaHlADQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNucHMsZHct
ZHBoeS0xcDIiOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAjcGh5LWNlbGxzID0gPDA+Ow0KPiA+ICvC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4OTAwMDAwNDAgMHgwIDB4MjA+LCA8MHgwIDB4OTAw
MDEwMDAgMHgwIDB4OD47DQo+ID4gK8KgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+IA0KPiBObywgZHJvcC4gQW5kIGZpeCB0aGUgb3JkZXIgb2YgcHJvcGVydGllcywgc2VlIERU
UyBjb2Rpbmcgc3R5bGUuDQo+IA0KPiA+ICvCoMKgwqAgfTsNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo+IA0KDQo=

