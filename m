Return-Path: <linux-media+bounces-6456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D68721C2
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 15:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5334BB25751
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 14:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6347C86AC2;
	Tue,  5 Mar 2024 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=butterbrot.org header.i=@butterbrot.org header.b="KfhZnLr4"
X-Original-To: linux-media@vger.kernel.org
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C9EC2
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.106.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709649723; cv=none; b=grPamvdPBoiz8CIkfxjCGEs4AmQ5f7m+Ydz6m8337PH79tAP+aiYXSDmMBJioQvfIOZzqJTe2U1xRoeMpV56f+1InaBkS40IFR58npY48nhqO+1cWa+P9aoTdqsc7RfUv78sQ4nqh8PmpYDDcO5vp+71haWhTwDxxJsjQ1/lvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709649723; c=relaxed/simple;
	bh=NvTLTtcNycMLwYpCec8N6lFk7J1pesXh1XnZUdWa6yY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KxbCg3ZBmgn09wkskSJu+Wtb0IoTVOweIg9BCQZMAFms1yXz0+m6UeaaOz6OfpDGZ7+q6fN1afn266Hzzsfn2UoBwOzXyQdXsW6MupQa9CQdGGqYVuVAwn+TjpHcUXLXjrcJ6Hy+E/QMQPBiVxtpnrAnCWflturhpgafb6DsR9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=butterbrot.org; spf=pass smtp.mailfrom=butterbrot.org; dkim=pass (2048-bit key) header.d=butterbrot.org header.i=@butterbrot.org header.b=KfhZnLr4; arc=none smtp.client-ip=176.9.106.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=butterbrot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=butterbrot.org
Received: from [192.168.1.48] (unknown [85.191.184.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by butterbrot.org (Postfix) with ESMTPSA id E714F4B4F756
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 15:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=butterbrot.org;
	s=202303; t=1709649389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=NvTLTtcNycMLwYpCec8N6lFk7J1pesXh1XnZUdWa6yY=;
	b=KfhZnLr48RWzeDNdSPMCn60vM3hP51Sm7JkUF7veZNgmgQTIO3D3Lp49EhBTtL95CEV+av
	VEBO4/qVbbFUp56V/19mivbsF9pScMBq11zgEKlpk0XQFRIv3Sm14jt30wBgtym36+TUlD
	BFVLonqJSlvQ8yIjJ0W0lVvrWQ6il5a5CnKox/Gx1mC8ENp7bTlq7V70bJJF2yqdAgc6nb
	ac8HsG/OAAtR9A7gH6cJRSu6NvWzLupxJYkLT8s+0BhdNIsto5ZT2kIPCaqpFbniosh9MI
	viwKoGAdfmlZp3+n1QTv3cFM+k0gQ+nd6CixWTzvsXUeBHfRSmUYE6h0CkeKtA==
Message-ID: <920db340-bbd5-4fcc-94e1-f11983b7d874@butterbrot.org>
Date: Tue, 5 Mar 2024 15:36:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-GB, da
From: Florian Echtler <floe@butterbrot.org>
Subject: Using the videobuf2 framework for USB bulk transfers?
Autocrypt: addr=floe@butterbrot.org; keydata=
 xsDiBDuvTgcRBAD3yCehD8VSv9/5ALV2PGNpRyPd/H7y4E0nh/fNHjOtq/Iy822ZQgPxP9+a
 nbtC7KMzT0JIr5ontFH4TuMxikeE92ID+h0a755FiHAtSACXzNcLY370YfRJuTQMBANEwf/T
 ozY7clf8uZc9emk0TLQJ7ZFksRAxd2Ql3lyGlM+jEQCg/6aPMk/pV3Jjfz01dckZH65DSb0E
 AKcZOV/KpQwPqRE1L7yEax19p1+38InBhGQg5ZORsPDXNDKAx5TovSM/4H68DzVjCTtb1Qig
 E2InSlT4qxOZq2hTIwsbUrl4YrOLG0msYeB+1avaVCxkjEs4e6fYX9VvJxUdgkYSmwWxzSGK
 wiEeRlbcNGdKeVKYezNyjRKO5OnSBACb3t89sJsqaotwh+CO4cwgKbjIgHnIjH5TminqiGt9
 chYXGA+IjkVef+Q/pWRzXj4IDC1gubW5GELuMa6WO+aMchJKfD4VDflvdUqWTuXKj6qjwxnY
 qtX/3O7QwVFoVgkPqsl8goAPSGk5lWHIvKJJUSMFgjWG+BafnppZs/R+Bc0lRmxvcmlhbiBF
 Y2h0bGVyIDxmbG9lQGJ1dHRlcmJyb3Qub3JnPsJjBBMRAgAjAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AFAk47tRkCGQEACgkQ7CzyshGvatgVzgCg9kkfrcPWEmqSADhAX4Bj83gZQEgA
 n1PrIrMQE85069aGgJE/kuMyWUJczsFNBDuvTggQCAD2Qle3CH8IF3KiutapQvMF6PlTETlP
 tvFuuUs4INoBp1ajFOmPQFXz0AfGy0OplK33TGSGSfgMg71l6RfUodNQ+PVZX9x2Uk89PY3b
 zpnhV5JZzf24rnRPxfx2vIPFRzBhznzJZv8V+bv9kV7HAarTW56NoKVyOtQa8L9GAFgr5fSI
 /VhOSdvNILSd5JEHNmszbDgNRR0PfIizHHxbLY7288kjwEPwpVsYjY67VYy4XTjTNP18F1dD
 ox0YbN4zISy1Kv884bEpQBgRjXyEpwpy1obEAxnIByl6ypUM2Zafq9AKUJsCRtMIPWakXUGf
 nHy9iUsiGSa6q6Jew1XpMgs7AAICCACB1zq0sSVcye/cvwTnHZyGvILT6VU8+xUxvmG9ota2
 yuk9A+0GSnDpjNxyBkmDBVQkLLvW8lBErPYvaq9pFMeYntOhYwRP31e7rbsWh48QjfkL5M/X
 Q5kFCTO4jVXHXYJ034x0vXamDDzFbAdUg/V/zN+KRIcEZcs8foIgC7BR6i/TsCsFHN3OHAmk
 hZ8NRB//UIJXxq3CcBXLiu2OGFrfoSvpAp5OzMyrWneMCaySmN/i3wSYl6h3Nl4YRMH6Yx+E
 RnNF5/cy3xUZODG1JHnEw+owc0dl3ch+oQe0t3zN5LGAznf7hYmOYl27xvym/FVA/skTD1wM
 MZhfxLVyis75wlQEGBECAAwFAjuvTggFGwwAAAAAEgkQ7CzyshGvatgHZUdQRwABASUVAKC7
 c7SIc/xurEhWVpzt1wPPsPOQ2wCglsSZ1yg7JIMh4o+a178IK9ozwQY=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m9RZLfGbbybS1vCpnQ5cuOQA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m9RZLfGbbybS1vCpnQ5cuOQA
Content-Type: multipart/mixed; boundary="------------BRpm14fi1BtCRiFlH9kndBJ3";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: linux-media@vger.kernel.org
Message-ID: <920db340-bbd5-4fcc-94e1-f11983b7d874@butterbrot.org>
Subject: Using the videobuf2 framework for USB bulk transfers?

--------------BRpm14fi1BtCRiFlH9kndBJ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCkknbSB0YWtpbmcgYW5vdGhlciBzdGFiIGF0IGZpeGluZyB0
aGUgRE1BIGJ1ZyBpbiB0aGUgc3VyNDAgZHJpdmVyIHdoaWNoIGhhcyBiZWVuIA0KcHJlc2Vu
dCBmb3Igc29tZSB0aW1lIG5vdy4NCg0KVGhlIGJ1ZyB3YXMgaW50cm9kdWNlZCBhcyBhIHNp
ZGUgZWZmZWN0IG9mIHRoaXMgY29tbWl0OiANCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9jb21taXQvNmViMDIzM2VjMmQwZGYyODhmZTg1MTVkNWIwYjJiMTU1NjJlMDVi
Yg0KDQpUaGUgc3VyNDAgaXMgYSBiaXQgb2YgYW4gb2RkIGR1Y2sgd2hpY2ggdXNlcyBVU0Ig
YnVsayB0cmFuc2ZlcnMgZm9yIHZpZGVvIGRhdGEsIA0Kc28gQUZBSUNUIHRoZXJlIGlzIG5v
IG90aGVyIGRyaXZlciBJIGNvdWxkIHVzZSBhcyBhbiBleGFtcGxlIGZvciB0aGlzIGNvbWJp
bmF0aW9uLg0KDQpJJ3ZlIHRyaWVkIHRoZSBmb2xsb3dpbmcgdmFyaWFudHM6DQoNCi0gdmlk
ZW9idWYyLWRtYS1zZyAodGhpcyBpcyB0aGUgY3VycmVudGx5IGJyb2tlbiBpbi1rZXJuZWwg
dmVyc2lvbik6DQoNCiAgIEZhaWxzIHdpdGggZXJyb3IgLTIyIChFSU5WQUwpIGluIHVzYl9z
Z19pbml0LCBiZWNhdXNlIHNndC0+bmVudHMgaXMgMC4gQ2FuJ3QNCiAgIHRlbGwgd2hhdCB0
aGUgcm9vdCBjYXVzZSBpcywgYnV0IGJhc2VkIG9uIHRoZSBtZXNzYWdlIG9mIHRoZSBicmVh
a2luZyBjb21taXQsDQogICBJIHdvdWxkIGFzc3VtZSB0aGF0IHVzaW5nIGRtYS1zZyBkaXJl
Y3RseSBmb3IgVVNCIGRldmljZXMgaXMgc2ltcGx5IG5vdA0KICAgc3VwcG9ydGVkPw0KDQot
IHZpZGVvYnVmMi12bWFsbG9jOg0KDQogICBGYWlscyB3aXRoIGRtZXNnIGVycm9yOiBlaGNp
LXBjaTogcmVqZWN0aW5nIERNQSBtYXAgb2Ygdm1hbGxvYyBtZW1vcnkgKHRoaXMgaXMNCiAg
IHNvcnQgb2YgdW5kZXJzdGFuZGFibGUsIEkgZ3Vlc3MsIGp1c3Qgd2FudGVkIHRvIGJlIHN1
cmUpLg0KDQotIHZpZGVvYnVmMi1kbWEtY29udGlnOg0KDQogICBGYWlscyB3aXRoIGRtZXNn
IGVycm9yOiBkbWEgYWxsb2Mgb2Ygc2l6ZSA1MjAxOTIgZmFpbGVkLiBUaGlzIHNlZW1zIHF1
aXRlIGxvdywNCiAgIGl0IHNob3VsZG4ndCBiZSBhbiBpc3N1ZSB0byBtYXAgNTAwayBvZiBj
b250aWd1b3VzIG1lbW9yeSBzb21ld2hlcmU/DQoNClNvLCBpbiBzdW1tYXJ5LCBteSBxdWVz
dGlvbiBpczogaG93IHNob3VsZCBJIHVzZSB0aGUgdmlkZW9idWYyIGZyYW1ld29yayB0byBn
ZXQgDQpVU0IgYnVsayBkYXRhIGludG8gVjRMMiBidWZmZXJzIGFzIGVmZmljaWVudGx5IGFz
IHBvc3NpYmxlPyBCZWNhdXNlIGl0IGRvZXMgc2VlbSANCnRoYXQgbm9uZSBvZiB0aGUgIm9i
dmlvdXMiIHNvbHV0aW9ucyB3b3Jrcy4uLg0KDQpUaGFuayB5b3UgYW5kIGJlc3QsIEZsb3Jp
YW4NCi0tIA0KU0VOVCBGUk9NIE1ZIERFQyBWVDUwIFRFUk1JTkFMDQo=

--------------BRpm14fi1BtCRiFlH9kndBJ3--

--------------m9RZLfGbbybS1vCpnQ5cuOQA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCZect7AUDAAAAAAAKCRDsLPKyEa9q2Ecd
AKDc0xDyhRTWz0sX3FLaSoRBkJiTQACg2Q35bd7UTk7ghTUR2naSQUBVT0w=
=k+gw
-----END PGP SIGNATURE-----

--------------m9RZLfGbbybS1vCpnQ5cuOQA--

