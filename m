Return-Path: <linux-media+bounces-30160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABDA8809B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7276F16F473
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7DC2BE7DB;
	Mon, 14 Apr 2025 12:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JpMtNzdn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900325F964
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634415; cv=none; b=RFxfCvtqvCxbJ4h3CARhcfz39iJWoVg88Nkw/VTFWp83juZfm63UjKYD1oBrQ6XZ+2VPkhckPZlFpgHpHZuyv8gs0IVBsZqeasCWEI3GbxAb0Zo1eTHXVo2qri+emBkMvyXt233MIm5XDpMMt7ztAFUNXArhz3H3lLYRt9zdLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634415; c=relaxed/simple;
	bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NBScDAPhPMxkRknUqTx1TxV4qutjEh4rUAefxc3U3neHh4PiMB+IMAu0exsk4Sc9DShH6w+wSCfGS9wEEX17woUXNVaq1NLntalV363TUZdZtbjz3edIRwd69siHBqR5XIrBJujEJmj+uH/OaSLqTKm3g32aBg7AnZo7un+aeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JpMtNzdn; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8efefec89so39442696d6.3
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634412; x=1745239212; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
        b=JpMtNzdn6glDwgrLGd3IIHZHqNUV8ZNKyQkhB4OjH1L8qcKxg5K9N8kO2JMa/n+Ht3
         cXu3XVBU+TTprn7k78BNCuzmOWz0OwRL7+qzbmUnpSqCtm7S1OrAya4kyicnWG9/c5PY
         Bh2WaRGWIwX7YgsPge4jq6QdpUGNTnufX/QByKZt0HuXmh0Y8XD0hdDZ/WbrEXPslTNa
         G69kJHvreNfPvZuO0lCZ6D2TEhM5Vnss8NtQzapm8GQgHBOsrgMKIjHTcyQMAZP29Pl6
         UTwkUBgBey1kN1yOnYi0xaABkzv6b8YsNio+ePo8Y1/ADhvdD17pI7qHDCnBReWDdH4f
         205w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634412; x=1745239212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
        b=t56QNW75mILsCn1VX5jCUPup0BjXk+Io9Aanch8tBqhOQgshWSYTavtpiIbdSR6RdS
         Oj8orihhEmNBYfHBC/gYVzuHQ+Bpxtz3Un9IfbX8LBDr67Nt0Zkp0lQq5llXxoT9+Dvs
         WbO2QIsfTHfIZYEXnBe6JCclNlwImBpcJ2X7riEM122H3EcqLcZuBTsIW4+z0GtQTjyI
         ooMNq/r7kR2RZESM2db2fsyMqGsvcSz299lec4h4pW9F4T8VgQqPv3APlMnXb/exU+33
         4u23VdNYXUgwyJSHQ8qpVeYfZv6z1/gpDlciEq3xqSSIFqGMunTFKc60TaPNMGHTkGW2
         5M1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGMg2nYIorrOD/zfNytefp0pAGbSdW5m+Ktj7JfBfLhwM9lpkiANkNOwOqPxCfJm0Bs+Lll6+7pEtcbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk9qJLppEA/7gD+gaXcIt60orlulxmWu0IvIkPMeHffDAy5//
	aZG9vj4L69Hs0Lr0oFz2CLCM8/axvEHmrL4dRPap5SMClrpBSIr/z75AjHdq0lM=
X-Gm-Gg: ASbGnctMx3cFU4pWdUQDJ7Rt8x6ilnhERibRJ7kj0bsXGXbh74V1IYwLrPU0EMESmuj
	nEwgT5iPu5ydiu4DOxpXToSj6U2xs1FM14ZJRTgtURdPW0kPRPMiJskXMsUePX62BOhkN1Px59j
	vSaeGdX51dure5J+vBEbxQk7BmcxoLeEYU+9aTNSXgt9yVfO/K76HOuR68TrybyVdf9GXENdUhb
	eFplK9j21n142hrjUGTicvTTGGdrH1OAkkhsywHYIjhyxG7gbLvu0gXa89mjyxoUlNo+Z9m5NBd
	zvXmeYZtN5Rkzd+fAM7pcqAkf9kj9lWSj+ifFb0VNx0Ifw==
X-Google-Smtp-Source: AGHT+IEkbFkFwojQpGraee89v+X8dSxjfxKK65sER14n9Mv9RQD0FEdieKFkmsXCfg907A7TCfC9Lw==
X-Received: by 2002:ad4:5763:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f23f180df4mr213244336d6.31.1744634411886;
        Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea08007sm82522326d6.86.2025.04.14.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Message-ID: <a43b8d8f51577fdf579f1bd602eadfdafcd21c08.camel@ndufresne.ca>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:09 -0400
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

TGUgbWVyY3JlZGkgMTggZMOpY2VtYnJlIDIwMjQgw6AgMTE6NTMgKzAxMDAsIEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIGEgw6ljcml0wqA6Cj4gQWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3Ig
dGhlIEFBTCwgQ09MT1IsIE1FUkdFIGFuZCBQQURESU5HCj4gaGFyZHdhcmUgY29tcG9uZW50cyBm
b3VuZCBpbiBNZWRpYVRlaydzIE1UODE4OCBTb0MuCj4gCj4gVGhpcyBoYXJkd2FyZSBpcyBjb21w
YXRpYmxlIHdpdGggTVQ4MTk1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpBY2tl
ZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPgoK
PiAtLS0KPiDCoC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGFhbC55YW1s
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssY29sb3IueWFtbMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbMKgwqDCoMKgwqAgfMKgIDQg
KysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55
YW1swqDCoMKgIHwgMTAgKysrKysrKy0tLQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGFhbC55YW1sCj4gaW5kZXggY2YyNDQzNDg1NGZmLi4xNDc5MDM1ZGE0MDkgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssYWFsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbAo+IEBAIC0yNSw2ICsyNSwxMCBAQCBw
cm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3At
YWFsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1hYWwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE5NS1tZHAzLWFhbAo+ICvCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTg4LW1kcDMtYWFsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1hYWwKPiDCoMKgwqDCoMKgwqAg
LSBpdGVtczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10MjcxMi1kaXNwLWFhbAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxjb2xvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbAo+IGluZGV4IDdkZjc4NmJiYWQyMC4uNzk5YzBi
OGZjMWY5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjb2xvci55YW1s
Cj4gQEAgLTI3LDYgKzI3LDEwIEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xvcgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVk
aWF0ZWssbXQ4MTczLWRpc3AtY29sb3IKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10ODE5NS1tZHAzLWNvbG9yCj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxt
dDgxODgtbWRwMy1jb2xvcgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVkaWF0ZWss
bXQ4MTk1LW1kcDMtY29sb3IKPiDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10NzYyMy1kaXNwLWNvbG9yCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJn
ZS55YW1sCj4gaW5kZXggZGFlODM5Mjc5OTUwLi40MTVhMjViYzE4ZmEgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbWVyZ2UueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtMjUsNiArMjUsMTAgQEAg
cHJvcGVydGllczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE3My1kaXNw
LW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJn
ZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtbWVyZ2UKPiAr
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE4OC1tZHAzLW1lcmdlCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1tZXJnZQo+IMKg
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG1lZGlh
dGVrLG10Njc5NS1kaXNwLW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVk
aWF0ZWssbXQ4MTczLWRpc3AtbWVyZ2UKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWsscGFkZGluZy55YW1sCj4gaW5kZXggYmUwN2JiZGM1NGUzLi44Njc4Nzg2NmNlZDAgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gQEAgLTIw
LDkgKzIwLDEzIEBAIGRlc2NyaXB0aW9uOgo+IMKgCj4gwqBwcm9wZXJ0aWVzOgo+IMKgwqAgY29t
cGF0aWJsZToKPiAtwqDCoMKgIGVudW06Cj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODgt
ZGlzcC1wYWRkaW5nCj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoCBvbmVPZjoKPiArwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIG1lZGlhdGVrLG10ODE4OC1kaXNwLXBhZGRpbmcKPiArwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtcGFkZGluZwo+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODgtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRk
aW5nCj4gwqAKPiDCoMKgIHJlZzoKPiDCoMKgwqDCoCBtYXhJdGVtczogMQo=


