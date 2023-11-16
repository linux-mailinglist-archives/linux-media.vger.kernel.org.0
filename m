Return-Path: <linux-media+bounces-444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F387EE0A4
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE50728101C
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631F230647;
	Thu, 16 Nov 2023 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="p5Xf2otB"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561AD18B
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137443; x=1700742243; i=ps.report@gmx.net;
	bh=ySeIlhOOwktLi3B5nIs5oiHBHk5RsCsPVrhMoG88W3o=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=p5Xf2otB22pUWFcJbjwHGoQGw+VDFWCKQflyg7naJsRuTRRJpwZPr20w69toZiTi
	 XSYAzEAoytC7yPWSN+tPmaVXgX6T6sBMQhwV0Zqrtaz+FlcYuoez5iYx38xo4PnO6
	 z8d1puFNad/hnmkikjLBS+JgtncmwTor+ZwKjObphCyaDcpebNanby1FOeLCNgWvl
	 QlQW4Toa1w2rQR/eGQWr8U0qzUJmc4VsYBmG+aTOyvWL6uWBgbhBaFz61teRa0E+C
	 aMFznnB+UulMrAzdapr6chMvPknDDKiYfnmSWxdjmbcNYsHzNqIKkrzvxb/e55s0d
	 sJWEBNY8W3Ye/EprEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.247]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmlT2-1rk7xV2gbO-00jpGU for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023
 13:24:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 2/4] qv4l2: enable Qt6 compile with Qt OpenGL support
Date: Thu, 16 Nov 2023 13:24:00 +0100
Message-ID: <20231116122402.28730-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116122402.28730-1-ps.report@gmx.net>
References: <20231116122402.28730-1-ps.report@gmx.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:OF9ROViI2UjOO9n3JbpqFzM1+zDExdFnwtW/zFyLm1PVMFFAk1T
 yiZ8zIj0TZcgEntFCvHDxp18mOh2T2Z1KAqfRK8ZLKAQj6NGI+wUu6+tHBqUlQmSYY48Vqv
 wYLVXMEK30UGDdtl4rOKyzBA4EKFw5r1zGCxP1BMXGKdf5U/H2FraBnr6yUk+t4hqZOcTU8
 eotYmggzMUpaO+tLbUqPQ==
UI-OutboundReport: notjunk:1;M01:P0:eU51BkVQiM8=;CPuUVyZQaMJVDlcFeeX547xZQHC
 6DkIzkvqa9v3kMx+kNs5Mpxg7/rAUQ5Qt5jA0+NNzNn1F04xFewtvIz7BXX4kHd9M8nuyI2g1
 TD+HaZdkhUKoSJby+3Zw420+ctJE24PX4d2OqCtoWg6j1rj7VZy85FXH+PFMM7gDVPzI8OVt4
 r79v7t3lcHXjO9UHjx6hMigTT6m/MEv8c0gl8hg8rWTr9/3lnGR8Enw4N4mY9MI9I2NwZGXkh
 uE+X/I7QhxloSnGbn54V7n/syq9k3I1/uWg5eKt6cW+nO6EuF73iZlQcxjT46qRLnr7Guhqwt
 Hg992FrVgRUZBgoKFh+bn4fNASXEO13umsO0HySvIoBju84xIhWg42QxrW3JIz4SFowvRJHNn
 hs5H8jIO02JHIE+ql9fa9X3hAVFDJHXzdGbTLlRK/fztWKwstx6x7geNp7Jwy/fLcgTz7Ah+W
 0yozSmbmgZcu6R8YD7TTTqFnkU2tF+03sPRpoyWPtU5PsU2DCBHEhqfOMog4W7cZzlBbLEq7G
 RWBKerSRPs8CfOhdCG3PA3/7FU98EuHX8PzLv+jbkOswHy1HtoCrbdoovh0fyfUGFguKVrNk3
 LniqOqca62DbhtWPQytWlVkJutzfg+xG3mAyVnWv4q8yaahQa6KdwvoXxN+Cn+mxcG7yy73vH
 taE/OrhsvGa1Pk9EmUF/8WcOSvOcspBqVzGqbOtjw6offTkWSCBZ3DlRJa5KpTXjBP3OB51Vz
 /oAUG1+1XCOKJXgcvXwBmDKsvDdCD+aP5PcAjKVrSr6hRKPBXOaMHmuE5/4d18YhJn0InJ1XS
 x8MAykPEmoijQ58f6CMuQhltYrRptvJyCQ9qALqfOUF3ivBGoGroZ9Q0aoC6sC6FdSFCIqUeq
 jkcJnKz96Clar8QbWVxeReCbu6eoUExU27Ftc8ONXfnusd3uDxNr5C5BIKKYOX8U44RGXwd5v
 1z48z3mVd9s/EPN62d7/Si1vXAg=

U2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0
aWxzL3F2NGwyL2NhcHR1cmUtd2luLWdsLmNwcCB8IDEyNSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0KIHV0aWxzL3F2NGwyL2NhcHR1cmUtd2luLWdsLmggICB8ICAxNyArKysrKwog
dXRpbHMvcXY0bDIvcXY0bDIuY3BwICAgICAgICAgIHwgICA0ICsrCiB1dGlscy9xdjRsMi9xdjRs
Mi5wcm8gICAgICAgICAgfCAgIDMgKwogNCBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4t
Z2wuY3BwIGIvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4tZ2wuY3BwCmluZGV4IDZjYmViNDI2Li43
ZTk5M2UzYiAxMDA2NDQKLS0tIGEvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4tZ2wuY3BwCisrKyBi
L3V0aWxzL3F2NGwyL2NhcHR1cmUtd2luLWdsLmNwcApAQCAtMTUxLDcgKzE1MSw5IEBAIENhcHR1
cmVXaW5HTEVuZ2luZTo6Q2FwdHVyZVdpbkdMRW5naW5lKCkgOgogCW1fbWluX2ZpbHRlcihHTF9O
RUFSRVNUKQogewogCW1ha2VDdXJyZW50KCk7CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJ
bV9nbGZ1bmN0aW9uLmluaXRpYWxpemVHTEZ1bmN0aW9ucyhjb250ZXh0KCkpOworI2VuZGlmCiB9
CiAKIENhcHR1cmVXaW5HTEVuZ2luZTo6fkNhcHR1cmVXaW5HTEVuZ2luZSgpCkBAIC0yODUsNiAr
Mjg3LDkgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnN0b3AoKQogCiB2b2lkIENhcHR1cmVX
aW5HTEVuZ2luZTo6aW5pdGlhbGl6ZUdMKCkKIHsKKyNpZiBRVF9WRVJTSU9OID49IDB4MDYwMDAw
CisJaW5pdGlhbGl6ZU9wZW5HTEZ1bmN0aW9ucygpOworI2VuZGlmCiAJZ2xTaGFkZU1vZGVsKEdM
X0ZMQVQpOwogCWdsRW5hYmxlKEdMX1RFWFRVUkVfMkQpOwogCWdsRW5hYmxlKEdMX0JMRU5EKTsK
QEAgLTMzNyw3ICszNDIsMTEgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnNldEZyYW1lKGlu
dCB3aWR0aCwgaW50IGhlaWdodCwgaW50IFdDcm9wLCBpbnQgSENyb3AsCiAJbV9mcmFtZURhdGEg
PSBkYXRhOwogCW1fZnJhbWVEYXRhMiA9IGRhdGEyID8gZGF0YTIgOiBkYXRhOwogCW1fZnJhbWVE
YXRhMyA9IGRhdGEzID8gZGF0YTMgOiBkYXRhOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAog
CXVwZGF0ZUdMKCk7CisjZWxzZQorCXVwZGF0ZSgpOworI2VuZGlmCiB9CiAKIHZvaWQgQ2FwdHVy
ZVdpbkdMRW5naW5lOjpjaGVja0Vycm9yKGNvbnN0IGNoYXIgKm1zZykKQEAgLTQzMSw4ICs0NDAs
MTMgQEAgYm9vbCBDYXB0dXJlV2luR0xFbmdpbmU6Omhhc05hdGl2ZUZvcm1hdChfX3UzMiBmb3Jt
YXQpCiAJCTAKIAl9OwogCisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJaWYgKCFtX2dsZnVu
Y3Rpb24uaGFzT3BlbkdMRmVhdHVyZShRR0xGdW5jdGlvbnM6OlNoYWRlcnMpKQogCQlyZXR1cm4g
ZmFsc2U7CisjZWxzZQorCWlmICghaGFzT3BlbkdMRmVhdHVyZShRT3BlbkdMRnVuY3Rpb25zOjpT
aGFkZXJzKSkKKwkJcmV0dXJuIGZhbHNlOworI2VuZGlmCiAKIAlmb3IgKGludCBpID0gMDsgc3Vw
cG9ydGVkX2ZtdHNbaV07IGkrKykKIAkJaWYgKHN1cHBvcnRlZF9mbXRzW2ldID09IGZvcm1hdCkK
QEAgLTQ0OSw3ICs0NjMsMTEgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OmNoYW5nZVNoYWRl
cigpCiAJZ2xNYXRyaXhNb2RlKEdMX1BST0pFQ1RJT04pOwogCWdsTG9hZElkZW50aXR5KCk7CiAJ
Z2xPcnRobygwLCBtX2ZyYW1lV2lkdGgsIG1fZnJhbWVIZWlnaHQsIDAsIDAsIDEpOworI2lmIFFU
X1ZFUlNJT04gPCAweDA2MDAwMAogCXJlc2l6ZUdMKFFHTFdpZGdldDo6d2lkdGgoKSwgUUdMV2lk
Z2V0OjpoZWlnaHQoKSk7CisjZWxzZQorCXJlc2l6ZUdMKFFPcGVuR0xXaWRnZXQ6OndpZHRoKCks
IFFPcGVuR0xXaWRnZXQ6OmhlaWdodCgpKTsKKyNlbmRpZgogCWNoZWNrRXJyb3IoIlJlbmRlciBz
ZXR0aW5ncy5cbiIpOwogCiAJc3dpdGNoIChtX2ZyYW1lRm9ybWF0KSB7CkBAIC0xMDEwLDcgKzEw
MjgsMTIgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnNoYWRlcl9ZVVYoX191MzIgZm9ybWF0
KQogCQkJICAgY29kZVN1ZmZpeDsKIAogCWJvb2wgc3JjX2MgPSBtX3NoYWRlclByb2dyYW0uYWRk
U2hhZGVyRnJvbVNvdXJjZUNvZGUoCi0JCQkJUUdMU2hhZGVyOjpGcmFnbWVudCwgY29kZUhlYWQg
KyBjb2RlVGFpbCk7CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCisJCQkJUUdMU2hhZGVyOjpG
cmFnbWVudCwKKyNlbHNlCisJCQkJUU9wZW5HTFNoYWRlcjo6RnJhZ21lbnQsCisjZW5kaWYKKwkJ
CQljb2RlSGVhZCArIGNvZGVUYWlsKTsKIAogCWlmICghc3JjX2MpCiAJCWZwcmludGYoc3RkZXJy
LCAiT3BlbkdMIEVycm9yOiBZVVYgc2hhZGVyIGNvbXBpbGF0aW9uIGZhaWxlZC5cbiIpOwpAQCAt
MTA1Myw3ICsxMDc2LDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpyZW5kZXJfWVVWKF9f
dTMyIGZvcm1hdCkKIAogCWdsQWN0aXZlVGV4dHVyZShHTF9URVhUVVJFMCk7CiAJZ2xCaW5kVGV4
dHVyZShHTF9URVhUVVJFXzJELCBtX3NjcmVlblRleHR1cmVbMF0pOworI2lmIFFUX1ZFUlNJT04g
PCAweDA2MDAwMAogCUdMaW50IFkgPSBtX2dsZnVuY3Rpb24uZ2xHZXRVbmlmb3JtTG9jYXRpb24o
bV9zaGFkZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAieXRleCIpOworI2Vsc2UKKwlHTGludCBZID0g
Z2xHZXRVbmlmb3JtTG9jYXRpb24obV9zaGFkZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAieXRleCIp
OworI2VuZGlmCiAJZ2xVbmlmb3JtMWkoWSwgMCk7CiAJZ2xUZXhTdWJJbWFnZTJEKEdMX1RFWFRV
UkVfMkQsIDAsIDAsIDAsIG1fZnJhbWVXaWR0aCwgbV9mcmFtZUhlaWdodCwKIAkJCW1fZ2xSZWQs
IEdMX1VOU0lHTkVEX0JZVEUsIG1fZnJhbWVEYXRhKTsKQEAgLTEwNjEsNyArMTA4OCwxMSBAQCB2
b2lkIENhcHR1cmVXaW5HTEVuZ2luZTo6cmVuZGVyX1lVVihfX3UzMiBmb3JtYXQpCiAKIAlnbEFj
dGl2ZVRleHR1cmUoR0xfVEVYVFVSRTEpOwogCWdsQmluZFRleHR1cmUoR0xfVEVYVFVSRV8yRCwg
bV9zY3JlZW5UZXh0dXJlWzFdKTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKIAlHTGludCBV
ID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9n
cmFtSWQoKSwgInV0ZXgiKTsKKyNlbHNlCisJR0xpbnQgVSA9IGdsR2V0VW5pZm9ybUxvY2F0aW9u
KG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInV0ZXgiKTsKKyNlbmRpZgogCWdsVW5pZm9y
bTFpKFUsIDEpOwogCXN3aXRjaCAoZm9ybWF0KSB7CiAJY2FzZSBWNEwyX1BJWF9GTVRfWVVWNDIy
UDoKQEAgLTEwODcsNyArMTExOCwxMSBAQCB2b2lkIENhcHR1cmVXaW5HTEVuZ2luZTo6cmVuZGVy
X1lVVihfX3UzMiBmb3JtYXQpCiAKIAlnbEFjdGl2ZVRleHR1cmUoR0xfVEVYVFVSRTIpOwogCWds
QmluZFRleHR1cmUoR0xfVEVYVFVSRV8yRCwgbV9zY3JlZW5UZXh0dXJlWzJdKTsKKyNpZiBRVF9W
RVJTSU9OIDwgMHgwNjAwMDAKIAlHTGludCBWID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxv
Y2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInZ0ZXgiKTsKKyNlbHNlCisJR0xp
bnQgViA9IGdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwg
InZ0ZXgiKTsKKyNlbmRpZgogCWdsVW5pZm9ybTFpKFYsIDIpOwogCXN3aXRjaCAoZm9ybWF0KSB7
CiAJY2FzZSBWNEwyX1BJWF9GTVRfWVVWNDIyUDoKQEAgLTExODksNyArMTIyNCwxMSBAQCB2b2lk
IENhcHR1cmVXaW5HTEVuZ2luZTo6c2hhZGVyX05WMTIoX191MzIgZm9ybWF0KQogCQkJICAgY29k
ZVN1ZmZpeDsKIAogCWJvb2wgc3JjX2MgPSBtX3NoYWRlclByb2dyYW0uYWRkU2hhZGVyRnJvbVNv
dXJjZUNvZGUoCisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJCQkJUUdMU2hhZGVyOjpGcmFn
bWVudCwKKyNlbHNlCisJCQkJUU9wZW5HTFNoYWRlcjo6RnJhZ21lbnQsCisjZW5kaWYKIAkJCQlR
U3RyaW5nKCIlMSUyJTMiKS5hcmcoY29kZUhlYWQsIGNvZGVCb2R5LCBjb2RlVGFpbCkpOwogCiAJ
aWYgKCFzcmNfYykKQEAgLTEyMTEsNyArMTI1MCwxMSBAQCB2b2lkIENhcHR1cmVXaW5HTEVuZ2lu
ZTo6cmVuZGVyX05WMTIoX191MzIgZm9ybWF0KQogCiAJZ2xBY3RpdmVUZXh0dXJlKEdMX1RFWFRV
UkUwKTsKIAlnbEJpbmRUZXh0dXJlKEdMX1RFWFRVUkVfMkQsIG1fc2NyZWVuVGV4dHVyZVswXSk7
CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJR0xpbnQgWSA9IG1fZ2xmdW5jdGlvbi5nbEdl
dFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclByb2dyYW0ucHJvZ3JhbUlkKCksICJ5dGV4Iik7Cisj
ZWxzZQorCUdMaW50IFkgPSBnbEdldFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclByb2dyYW0ucHJv
Z3JhbUlkKCksICJ5dGV4Iik7CisjZW5kaWYKIAlnbFVuaWZvcm0xaShZLCAwKTsKIAlnbFRleFN1
YkltYWdlMkQoR0xfVEVYVFVSRV8yRCwgMCwgMCwgMCwgbV9mcmFtZVdpZHRoLCBtX2ZyYW1lSGVp
Z2h0LAogCQkJbV9nbFJlZCwgR0xfVU5TSUdORURfQllURSwgbV9mcmFtZURhdGEpOwpAQCAtMTIx
OSw3ICsxMjYyLDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpyZW5kZXJfTlYxMihfX3Uz
MiBmb3JtYXQpCiAKIAlnbEFjdGl2ZVRleHR1cmUoR0xfVEVYVFVSRTEpOwogCWdsQmluZFRleHR1
cmUoR0xfVEVYVFVSRV8yRCwgbV9zY3JlZW5UZXh0dXJlWzFdKTsKKyNpZiBRVF9WRVJTSU9OIDwg
MHgwNjAwMDAKIAlHTGludCBVID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxvY2F0aW9uKG1f
c2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInV2dGV4Iik7CisjZWxzZQorCUdMaW50IFUgPSBn
bEdldFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclByb2dyYW0ucHJvZ3JhbUlkKCksICJ1dnRleCIp
OworI2VuZGlmCiAJZ2xVbmlmb3JtMWkoVSwgMSk7CiAJc3dpdGNoIChmb3JtYXQpIHsKIAljYXNl
IFY0TDJfUElYX0ZNVF9OVjEyOgpAQCAtMTMwNyw3ICsxMzU0LDExIEBAIHZvaWQgQ2FwdHVyZVdp
bkdMRW5naW5lOjpzaGFkZXJfTlYyNChfX3UzMiBmb3JtYXQpCiAJCQkgICBjb2RlU3VmZml4Owog
CiAJYm9vbCBzcmNfYyA9IG1fc2hhZGVyUHJvZ3JhbS5hZGRTaGFkZXJGcm9tU291cmNlQ29kZSgK
KyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKIAkJCQlRR0xTaGFkZXI6OkZyYWdtZW50LAorI2Vs
c2UKKwkJCQlRT3BlbkdMU2hhZGVyOjpGcmFnbWVudCwKKyNlbmRpZgogCQkJCVFTdHJpbmcoIiUx
JTIlMyIpLmFyZyhjb2RlSGVhZCwgY29kZUJvZHksIGNvZGVUYWlsKSk7CiAKIAlpZiAoIXNyY19j
KQpAQCAtMTMyNyw3ICsxMzc4LDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpyZW5kZXJf
TlYyNChfX3UzMiBmb3JtYXQpCiAKIAlnbEFjdGl2ZVRleHR1cmUoR0xfVEVYVFVSRTApOwogCWds
QmluZFRleHR1cmUoR0xfVEVYVFVSRV8yRCwgbV9zY3JlZW5UZXh0dXJlWzBdKTsKKyNpZiBRVF9W
RVJTSU9OIDwgMHgwNjAwMDAKIAlHTGludCBZID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxv
Y2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInl0ZXgiKTsKKyNlbHNlCisJR0xp
bnQgWSA9IGdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwg
Inl0ZXgiKTsKKyNlbmRpZgogCWdsVW5pZm9ybTFpKFksIDApOwogCWdsVGV4U3ViSW1hZ2UyRChH
TF9URVhUVVJFXzJELCAwLCAwLCAwLCBtX2ZyYW1lV2lkdGgsIG1fZnJhbWVIZWlnaHQsCiAJCQlt
X2dsUmVkLCBHTF9VTlNJR05FRF9CWVRFLCBtX2ZyYW1lRGF0YSk7CkBAIC0xMzM1LDcgKzEzOTAs
MTEgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnJlbmRlcl9OVjI0KF9fdTMyIGZvcm1hdCkK
IAogCWdsQWN0aXZlVGV4dHVyZShHTF9URVhUVVJFMSk7CiAJZ2xCaW5kVGV4dHVyZShHTF9URVhU
VVJFXzJELCBtX3NjcmVlblRleHR1cmVbMV0pOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAog
CUdMaW50IFUgPSBtX2dsZnVuY3Rpb24uZ2xHZXRVbmlmb3JtTG9jYXRpb24obV9zaGFkZXJQcm9n
cmFtLnByb2dyYW1JZCgpLCAidXZ0ZXgiKTsKKyNlbHNlCisJR0xpbnQgVSA9IGdsR2V0VW5pZm9y
bUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInV2dGV4Iik7CisjZW5kaWYK
IAlnbFVuaWZvcm0xaShVLCAxKTsKIAlnbFRleFN1YkltYWdlMkQoR0xfVEVYVFVSRV8yRCwgMCwg
MCwgMCwgbV9mcmFtZVdpZHRoLCBtX2ZyYW1lSGVpZ2h0LAogCQkJbV9nbFJlZEdyZWVuLCBHTF9V
TlNJR05FRF9CWVRFLApAQCAtMTQxOSw4ICsxNDc4LDEyIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5n
aW5lOjpzaGFkZXJfTlYxNihfX3UzMiBmb3JtYXQpCiAJCQkgICBjb2RlU3VmZml4OwogCiAJYm9v
bCBzcmNfb2sgPSBtX3NoYWRlclByb2dyYW0uYWRkU2hhZGVyRnJvbVNvdXJjZUNvZGUoCi0JCQkJ
UUdMU2hhZGVyOjpGcmFnbWVudCwgUVN0cmluZygiJTElMiUzIikuYXJnKGNvZGVIZWFkLCBjb2Rl
Qm9keSwgY29kZVRhaWwpCi0JCQkJKTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKKwkJCQlR
R0xTaGFkZXI6OkZyYWdtZW50LAorI2Vsc2UKKwkJCQlRT3BlbkdMU2hhZGVyOjpGcmFnbWVudCwK
KyNlbmRpZgorCQkJCVFTdHJpbmcoIiUxJTIlMyIpLmFyZyhjb2RlSGVhZCwgY29kZUJvZHksIGNv
ZGVUYWlsKSk7CiAKIAlpZiAoIXNyY19vaykKIAkJZnByaW50ZihzdGRlcnIsICJPcGVuR0wgRXJy
b3I6IE5WMTYgc2hhZGVyIGNvbXBpbGF0aW9uIGZhaWxlZC5cbiIpOwpAQCAtMTQ0MCw3ICsxNTAz
LDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpyZW5kZXJfTlYxNihfX3UzMiBmb3JtYXQp
CiAKIAlnbEFjdGl2ZVRleHR1cmUoR0xfVEVYVFVSRTApOwogCWdsQmluZFRleHR1cmUoR0xfVEVY
VFVSRV8yRCwgbV9zY3JlZW5UZXh0dXJlWzBdKTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAK
IAlHTGludCBZID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJv
Z3JhbS5wcm9ncmFtSWQoKSwgInl0ZXgiKTsKKyNlbHNlCisJR0xpbnQgWSA9IGdsR2V0VW5pZm9y
bUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInl0ZXgiKTsKKyNlbmRpZgog
CWdsVW5pZm9ybTFpKFksIDApOwogCWdsVGV4U3ViSW1hZ2UyRChHTF9URVhUVVJFXzJELCAwLCAw
LCAwLCBtX2ZyYW1lV2lkdGgsIG1fZnJhbWVIZWlnaHQsCiAJCQltX2dsUmVkLCBHTF9VTlNJR05F
RF9CWVRFLCBtX2ZyYW1lRGF0YSk7CkBAIC0xNDQ4LDcgKzE1MTUsMTEgQEAgdm9pZCBDYXB0dXJl
V2luR0xFbmdpbmU6OnJlbmRlcl9OVjE2KF9fdTMyIGZvcm1hdCkKIAogCWdsQWN0aXZlVGV4dHVy
ZShHTF9URVhUVVJFMSk7CiAJZ2xCaW5kVGV4dHVyZShHTF9URVhUVVJFXzJELCBtX3NjcmVlblRl
eHR1cmVbMV0pOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogCUdMaW50IFVWID0gbV9nbGZ1
bmN0aW9uLmdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwg
InV2dGV4Iik7CisjZWxzZQorCUdMaW50IFVWID0gZ2xHZXRVbmlmb3JtTG9jYXRpb24obV9zaGFk
ZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAidXZ0ZXgiKTsKKyNlbmRpZgogCWdsVW5pZm9ybTFpKFVW
LCAxKTsKIAlzd2l0Y2ggKGZvcm1hdCkgewogCWNhc2UgVjRMMl9QSVhfRk1UX05WMTY6CkBAIC0x
NTU5LDggKzE2MzAsMTIgQEAgdm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnNoYWRlcl9ZVVkyKF9f
dTMyIGZvcm1hdCkKIAkJCSAgIGNvZGVTdWZmaXg7CiAKIAlib29sIHNyY19vayA9IG1fc2hhZGVy
UHJvZ3JhbS5hZGRTaGFkZXJGcm9tU291cmNlQ29kZSgKLQkJCQlRR0xTaGFkZXI6OkZyYWdtZW50
LCBRU3RyaW5nKCIlMSUyJTMiKS5hcmcoY29kZUhlYWQsIGNvZGVCb2R5LCBjb2RlVGFpbCkKLQkJ
CQkpOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAorCQkJCVFHTFNoYWRlcjo6RnJhZ21lbnQs
CisjZWxzZQorCQkJCVFPcGVuR0xTaGFkZXI6OkZyYWdtZW50LAorI2VuZGlmCisJCQkJUVN0cmlu
ZygiJTElMiUzIikuYXJnKGNvZGVIZWFkLCBjb2RlQm9keSwgY29kZVRhaWwpKTsKIAogCWlmICgh
c3JjX29rKQogCQlmcHJpbnRmKHN0ZGVyciwgIk9wZW5HTCBFcnJvcjogWVVZMiBzaGFkZXIgY29t
cGlsYXRpb24gZmFpbGVkLlxuIik7CkBAIC0xNTgwLDcgKzE2NTUsMTEgQEAgdm9pZCBDYXB0dXJl
V2luR0xFbmdpbmU6OnJlbmRlcl9ZVVkyKF9fdTMyIGZvcm1hdCkKIAogCWdsQWN0aXZlVGV4dHVy
ZShHTF9URVhUVVJFMCk7CiAJZ2xCaW5kVGV4dHVyZShHTF9URVhUVVJFXzJELCBtX3NjcmVlblRl
eHR1cmVbMF0pOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogCUdMaW50IFkgPSBtX2dsZnVu
Y3Rpb24uZ2xHZXRVbmlmb3JtTG9jYXRpb24obV9zaGFkZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAi
dGV4Iik7CisjZWxzZQorCUdMaW50IFkgPSBnbEdldFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclBy
b2dyYW0ucHJvZ3JhbUlkKCksICJ0ZXgiKTsKKyNlbmRpZgogCWdsVW5pZm9ybTFpKFksIDApOwog
CWdsVGV4U3ViSW1hZ2UyRChHTF9URVhUVVJFXzJELCAwLCAwLCAwLCBtX2ZyYW1lV2lkdGggLyAy
LCBtX2ZyYW1lSGVpZ2h0LAogCQkJR0xfUkdCQSwgR0xfVU5TSUdORURfQllURSwgbV9mcmFtZURh
dGEpOwpAQCAtMTc4NSw4ICsxODY0LDEyIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpzaGFk
ZXJfUkdCKF9fdTMyIGZvcm1hdCkKIAkJICAgIChoYXNBbHBoYSA/IGNvZGVTdWZmaXhXaXRoQWxw
aGEgOiBjb2RlU3VmZml4KTsKIAogCWJvb2wgc3JjX29rID0gbV9zaGFkZXJQcm9ncmFtLmFkZFNo
YWRlckZyb21Tb3VyY2VDb2RlKAotCQkJCVFHTFNoYWRlcjo6RnJhZ21lbnQsIFFTdHJpbmcoIiUx
JTIiKS5hcmcoY29kZUhlYWQsIGNvZGVUYWlsKQotCQkJCSk7CisjaWYgUVRfVkVSU0lPTiA8IDB4
MDYwMDAwCisJCQkJUUdMU2hhZGVyOjpGcmFnbWVudCwKKyNlbHNlCisJCQkJUU9wZW5HTFNoYWRl
cjo6RnJhZ21lbnQsCisjZW5kaWYKKwkJCQlRU3RyaW5nKCIlMSUyIikuYXJnKGNvZGVIZWFkLCBj
b2RlVGFpbCkpOwogCiAJaWYgKCFzcmNfb2spCiAJCWZwcmludGYoc3RkZXJyLCAiT3BlbkdMIEVy
cm9yOiBSR0Igc2hhZGVyIGNvbXBpbGF0aW9uIGZhaWxlZC5cbiIpOwpAQCAtMTc5OCw3ICsxODgx
LDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdMRW5naW5lOjpyZW5kZXJfUkdCKF9fdTMyIGZvcm1hdCkK
IHsKIAlnbEFjdGl2ZVRleHR1cmUoR0xfVEVYVFVSRTApOwogCWdsQmluZFRleHR1cmUoR0xfVEVY
VFVSRV8yRCwgbV9zY3JlZW5UZXh0dXJlWzBdKTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAK
IAlHTGludCBZID0gbV9nbGZ1bmN0aW9uLmdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJv
Z3JhbS5wcm9ncmFtSWQoKSwgInRleCIpOworI2Vsc2UKKwlHTGludCBZID0gZ2xHZXRVbmlmb3Jt
TG9jYXRpb24obV9zaGFkZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAidGV4Iik7CisjZW5kaWYKIAln
bFVuaWZvcm0xaShZLCAwKTsKIAlpbnQgaWR4ID0gZ2xHZXRVbmlmb3JtTG9jYXRpb24obV9zaGFk
ZXJQcm9ncmFtLnByb2dyYW1JZCgpLCAidGV4X2giKTsgLy8gVGV4dHVyZSBoZWlnaHQKIAlnbFVu
aWZvcm0xZihpZHgsIG1fZnJhbWVIZWlnaHQpOwpAQCAtMjAxNiw4ICsyMTAzLDEyIEBAIHZvaWQg
Q2FwdHVyZVdpbkdMRW5naW5lOjpzaGFkZXJfQmF5ZXIoX191MzIgZm9ybWF0KQogCQkgICAgY29k
ZVN1ZmZpeDsKIAogCWJvb2wgc3JjX29rID0gbV9zaGFkZXJQcm9ncmFtLmFkZFNoYWRlckZyb21T
b3VyY2VDb2RlKAotCQkJCVFHTFNoYWRlcjo6RnJhZ21lbnQsIFFTdHJpbmcoIiUxJTIiKS5hcmco
Y29kZUhlYWQsIGNvZGVUYWlsKQotCQkJCSk7CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCisJ
CQkJUUdMU2hhZGVyOjpGcmFnbWVudCwKKyNlbHNlCisJCQkJUU9wZW5HTFNoYWRlcjo6RnJhZ21l
bnQsCisjZW5kaWYKKwkJCQlRU3RyaW5nKCIlMSUyIikuYXJnKGNvZGVIZWFkLCBjb2RlVGFpbCkp
OwogCiAJaWYgKCFzcmNfb2spCiAJCWZwcmludGYoc3RkZXJyLCAiT3BlbkdMIEVycm9yOiBCYXll
ciBzaGFkZXIgY29tcGlsYXRpb24gZmFpbGVkLlxuIik7CkBAIC0yMDI5LDcgKzIxMjAsMTEgQEAg
dm9pZCBDYXB0dXJlV2luR0xFbmdpbmU6OnJlbmRlcl9CYXllcihfX3UzMiBmb3JtYXQpCiB7CiAJ
Z2xBY3RpdmVUZXh0dXJlKEdMX1RFWFRVUkUwKTsKIAlnbEJpbmRUZXh0dXJlKEdMX1RFWFRVUkVf
MkQsIG1fc2NyZWVuVGV4dHVyZVswXSk7CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJR0xp
bnQgWSA9IG1fZ2xmdW5jdGlvbi5nbEdldFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclByb2dyYW0u
cHJvZ3JhbUlkKCksICJ0ZXgiKTsKKyNlbHNlCisJR0xpbnQgWSA9IGdsR2V0VW5pZm9ybUxvY2F0
aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFtSWQoKSwgInRleCIpOworI2VuZGlmCiAJZ2xVbmlm
b3JtMWkoWSwgMCk7CiAJaW50IGlkeCA9IGdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJv
Z3JhbS5wcm9ncmFtSWQoKSwgInRleF9oIik7IC8vIFRleHR1cmUgaGVpZ2h0CiAJZ2xVbmlmb3Jt
MWYoaWR4LCBtX2ZyYW1lSGVpZ2h0KTsKQEAgLTIxNDYsOCArMjI0MSwxMiBAQCB2b2lkIENhcHR1
cmVXaW5HTEVuZ2luZTo6c2hhZGVyX1lVVl9wYWNrZWQoX191MzIgZm9ybWF0KQogCQkJICAgKGhh
c0FscGhhID8gY29kZVN1ZmZpeFdpdGhBbHBoYSA6IGNvZGVTdWZmaXgpOwogCiAJYm9vbCBzcmNf
b2sgPSBtX3NoYWRlclByb2dyYW0uYWRkU2hhZGVyRnJvbVNvdXJjZUNvZGUoCi0JCQkJUUdMU2hh
ZGVyOjpGcmFnbWVudCwgUVN0cmluZygiJTElMiIpLmFyZyhjb2RlSGVhZCwgY29kZVRhaWwpCi0J
CQkJKTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKKwkJCQlRR0xTaGFkZXI6OkZyYWdtZW50
LAorI2Vsc2UKKwkJCQlRT3BlbkdMU2hhZGVyOjpGcmFnbWVudCwKKyNlbmRpZgorCQkJCVFTdHJp
bmcoIiUxJTIiKS5hcmcoY29kZUhlYWQsIGNvZGVUYWlsKSk7CiAKIAlpZiAoIXNyY19vaykKIAkJ
ZnByaW50ZihzdGRlcnIsICJPcGVuR0wgRXJyb3I6IFBhY2tlZCBZVVYgc2hhZGVyIGNvbXBpbGF0
aW9uIGZhaWxlZC5cbiIpOwpAQCAtMjE1OSw3ICsyMjU4LDExIEBAIHZvaWQgQ2FwdHVyZVdpbkdM
RW5naW5lOjpyZW5kZXJfWVVWX3BhY2tlZChfX3UzMiBmb3JtYXQpCiB7CiAJZ2xBY3RpdmVUZXh0
dXJlKEdMX1RFWFRVUkUwKTsKIAlnbEJpbmRUZXh0dXJlKEdMX1RFWFRVUkVfMkQsIG1fc2NyZWVu
VGV4dHVyZVswXSk7CisjaWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJR0xpbnQgWSA9IG1fZ2xm
dW5jdGlvbi5nbEdldFVuaWZvcm1Mb2NhdGlvbihtX3NoYWRlclByb2dyYW0ucHJvZ3JhbUlkKCks
ICJ0ZXgiKTsKKyNlbHNlCisJR0xpbnQgWSA9IGdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVy
UHJvZ3JhbS5wcm9ncmFtSWQoKSwgInRleCIpOworI2VuZGlmCiAJZ2xVbmlmb3JtMWkoWSwgMCk7
CiAJaW50IGlkeCA9IGdsR2V0VW5pZm9ybUxvY2F0aW9uKG1fc2hhZGVyUHJvZ3JhbS5wcm9ncmFt
SWQoKSwgInRleF9oIik7IC8vIFRleHR1cmUgaGVpZ2h0CiAJZ2xVbmlmb3JtMWYoaWR4LCBtX2Zy
YW1lSGVpZ2h0KTsKZGlmZiAtLWdpdCBhL3V0aWxzL3F2NGwyL2NhcHR1cmUtd2luLWdsLmggYi91
dGlscy9xdjRsMi9jYXB0dXJlLXdpbi1nbC5oCmluZGV4IGUyN2IyYjNmLi45NjM3NjkzNCAxMDA2
NDQKLS0tIGEvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4tZ2wuaAorKysgYi91dGlscy9xdjRsMi9j
YXB0dXJlLXdpbi1nbC5oCkBAIC0xMCwxMCArMTAsMTcgQEAKICNkZWZpbmUgR0xfR0xFWFRfUFJP
VE9UWVBFUwogI2RlZmluZSBRVF9OT19PUEVOR0xfRVNfMgogCisjaW5jbHVkZSA8UXRDb3JlPgor
I2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogI2luY2x1ZGUgPFFHTFdpZGdldD4KICNpbmNsdWRl
IDxRR0xTaGFkZXI+CiAjaW5jbHVkZSA8UUdMU2hhZGVyUHJvZ3JhbT4KICNpbmNsdWRlIDxRR0xG
dW5jdGlvbnM+CisjZWxzZQorI2luY2x1ZGUgPFFPcGVuR0xXaWRnZXQ+CisjaW5jbHVkZSA8UU9w
ZW5HTEZ1bmN0aW9ucz4KKyNpbmNsdWRlIDxRT3BlbkdMU2hhZGVyUHJvZ3JhbT4KKyNlbmRpZgog
I2VuZGlmCiAKICNpbmNsdWRlICJxdjRsMi5oIgpAQCAtMjYsNyArMzMsMTEgQEAKIC8vIFRoaXMg
bXVzdCBiZSBlcXVhbCB0byB0aGUgbWF4IG51bWJlciBvZiB0ZXh0dXJlcyB0aGF0IGFueSBzaGFk
ZXIgdXNlcwogI2RlZmluZSBNQVhfVEVYVFVSRVNfTkVFREVEIDMKIAorI2lmIFFUX1ZFUlNJT04g
PCAweDA2MDAwMAogY2xhc3MgQ2FwdHVyZVdpbkdMRW5naW5lIDogcHVibGljIFFHTFdpZGdldAor
I2Vsc2UKK2NsYXNzIENhcHR1cmVXaW5HTEVuZ2luZSA6IHB1YmxpYyBRT3BlbkdMV2lkZ2V0LCBw
cm90ZWN0ZWQgUU9wZW5HTEZ1bmN0aW9ucworI2VuZGlmCiB7CiBwdWJsaWM6CiAJQ2FwdHVyZVdp
bkdMRW5naW5lKCk7CkBAIC0xMDIsMTEgKzExMywxNyBAQCBwcml2YXRlOgogCWJvb2wgbV9mb3Jt
YXRDaGFuZ2U7CiAJX191MzIgbV9mcmFtZUZvcm1hdDsKIAlHTHVpbnQgbV9zY3JlZW5UZXh0dXJl
W01BWF9URVhUVVJFU19ORUVERURdOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogCVFHTEZ1
bmN0aW9ucyBtX2dsZnVuY3Rpb247CisjZW5kaWYKIAl1bnNpZ25lZCBjaGFyICptX2ZyYW1lRGF0
YTsKIAl1bnNpZ25lZCBjaGFyICptX2ZyYW1lRGF0YTI7CiAJdW5zaWduZWQgY2hhciAqbV9mcmFt
ZURhdGEzOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogCVFHTFNoYWRlclByb2dyYW0gbV9z
aGFkZXJQcm9ncmFtOworI2Vsc2UKKwlRT3BlbkdMU2hhZGVyUHJvZ3JhbSBtX3NoYWRlclByb2dy
YW07CisjZW5kaWYKIAlib29sIG1faGF2ZUZyYW1lYnVmZmVyU1JHQjsKIAlib29sIG1faGFzR0xS
ZWQ7CiAJdW5zaWduZWQgbV9nbFJlZDsKZGlmZiAtLWdpdCBhL3V0aWxzL3F2NGwyL3F2NGwyLmNw
cCBiL3V0aWxzL3F2NGwyL3F2NGwyLmNwcAppbmRleCBlMzdlZTg3Zi4uNTM0YmVkYjIgMTAwNjQ0
Ci0tLSBhL3V0aWxzL3F2NGwyL3F2NGwyLmNwcAorKysgYi91dGlscy9xdjRsMi9xdjRsMi5jcHAK
QEAgLTQwMSw3ICs0MDEsMTEgQEAgdm9pZCBBcHBsaWNhdGlvbldpbmRvdzo6c2V0RGV2aWNlKGNv
bnN0IFFTdHJpbmcgJmRldmljZSwgYm9vbCByYXdPcGVuKQogewogCWNsb3NlRGV2aWNlKCk7CiAJ
bV9zaWdNYXBwZXIgPSBuZXcgUVNpZ25hbE1hcHBlcih0aGlzKTsKKyNpZiBRVF9WRVJTSU9OIDwg
MHgwNjAwMDAKIAljb25uZWN0KG1fc2lnTWFwcGVyLCBTSUdOQUwobWFwcGVkKGludCkpLCB0aGlz
LCBTTE9UKGN0cmxBY3Rpb24oaW50KSkpOworI2Vsc2UKKwljb25uZWN0KG1fc2lnTWFwcGVyLCAm
UVNpZ25hbE1hcHBlcjo6bWFwcGVkSW50LCB0aGlzLCAmQXBwbGljYXRpb25XaW5kb3c6OmN0cmxB
Y3Rpb24pOworI2VuZGlmCiAKIAlzX2RpcmVjdChyYXdPcGVuKTsKIApkaWZmIC0tZ2l0IGEvdXRp
bHMvcXY0bDIvcXY0bDIucHJvIGIvdXRpbHMvcXY0bDIvcXY0bDIucHJvCmluZGV4IDFlYTA3Mzc0
Li5hOTM0M2M4OSAxMDA2NDQKLS0tIGEvdXRpbHMvcXY0bDIvcXY0bDIucHJvCisrKyBiL3V0aWxz
L3F2NGwyL3F2NGwyLnBybwpAQCAtOCw2ICs4LDkgQEAgQ09ORklHICs9IGRlYnVnCiAKIGdyZWF0
ZXJUaGFuKFFUX01BSk9SX1ZFUlNJT04sIDQpOiBRVCArPSB3aWRnZXRzCiBncmVhdGVyVGhhbihR
VF9NQUpPUl9WRVJTSU9OLCA1KTogUVQgKz0gY29yZTVjb21wYXQKKyMgb3BlbmdsOiB0byBkaXNh
YmxlIG9wZW5nbCBzdXBwcG9ydCBvbiBRdDYgY29tbWVudCBvdXQgdGhlCisjIGZvbGxvd2luZyBs
aW5lCitncmVhdGVyVGhhbihRVF9NQUpPUl9WRVJTSU9OLCA1KTogUVQgKz0gb3Blbmdsd2lkZ2V0
cwogCiAjIGFkanVzdCB0byB5b3VyIGxvY2FsIG1lc29uIGJ1aWxkIHBhdGgKIE1FU09OX0JVSUxE
X1BBVEggPSAkJFBXRC9idWlsZC1tZXNvbgotLSAKMi40Mi4xCgo=

