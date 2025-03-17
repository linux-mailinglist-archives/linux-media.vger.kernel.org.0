Return-Path: <linux-media+bounces-28333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC5A63B60
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 03:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C926188DCB1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 02:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF394146A60;
	Mon, 17 Mar 2025 02:21:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B741C71;
	Mon, 17 Mar 2025 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742178098; cv=none; b=VLPG8HrhpMrFEhcOTCohieiCL+ncjvS/bH5ospCECGDt9pZd4szcUCAPIfnR9Z6LZfq8bDUofMn9ijC6+9yExPyqecgonFva0ZKgAMWlaJQRQMiNV5RQcLiY9tkZefIaaExJOgzwaT2EkMf/BrdZVx8l9mbMgsUi0TbrsNjzsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742178098; c=relaxed/simple;
	bh=84h1O8DcSONgrEc/QxED8/rrm3K/RmQEr9m0awU9UjQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=jtjvcIIwqWer9AacaWY6YB7ZyA26jpjj2P2XnoQtiDA4+HGe0lP3aaWGugUrW1lEw9XQptbn7ilAxCNfV+g+izzibi1E/f0SFUUcMkciahbMtNP4sSs9/LFmQ3cZLQKxfzEJ+YRzH85Ett/1M5SDhRe+v8bqVPTmLi4W7v3P528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGJct3tDhz5B1H4;
	Mon, 17 Mar 2025 10:21:34 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52H2LKJV021874;
	Mon, 17 Mar 2025 10:21:21 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 10:21:22 +0800 (CST)
Date: Mon, 17 Mar 2025 10:21:22 +0800 (CST)
X-Zmail-TransId: 2afb67d78722ffffffff87f-23ebf
X-Mailer: Zmail v1.0
Message-ID: <202503171021222703hl0ry06tOCRmPFcWNp5U@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <sumit.semwal@linaro.org>
Cc: <benjamin.gaignard@collabora.com>, <brian.starkey@arm.com>,
        <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYzXSBkbWEtYnVmOiBoZWFwczogUmVwbGFjZSBuZXN0ZWQgbWF4KCkgd2l0aCBzaW5nbGUgbWF4Mygp?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 52H2LKJV021874
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7872E.000/4ZGJct3tDhz5B1H4



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTogRmVuZ1dlaSA8ZmVuZy53ZWk4QHp0ZS5jb20uY24+DQoNClVzZSBtYXgzKCkgbWFjcm8g
aW5zdGVhZCBvZiBuZXN0aW5nIG1heCgpIHRvIHNpbXBsaWZ5IHRoZSByZXR1cm4NCnN0YXRlbWVu
dC4NCg0KU2lnbmVkLW9mZi1ieTogRmVuZ1dlaSA8ZmVuZy53ZWk4QHp0ZS5jb20uY24+DQotLS0N
CnYyIC0+IHYzDQpmaXggdGhlIGZvcm1hdCBvZiB0aGlzIHBhdGNoDQogZHJpdmVycy9kbWEtYnVm
L2RtYS1oZWFwLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jDQppbmRleCAzY2JlODdkNGE0NjQuLjk2Y2I5YWI1NzMx
YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jDQorKysgYi9kcml2ZXJz
L2RtYS1idWYvZG1hLWhlYXAuYw0KQEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0aWMgbG9uZyBkbWFf
aGVhcF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IHVjbWQsDQogCQlpbl9z
aXplID0gMDsNCiAJaWYgKCh1Y21kICYga2NtZCAmIElPQ19PVVQpID09IDApDQogCQlvdXRfc2l6
ZSA9IDA7DQotCWtzaXplID0gbWF4KG1heChpbl9zaXplLCBvdXRfc2l6ZSksIGRydl9zaXplKTsN
CisJa3NpemUgPSBtYXgzKGluX3NpemUsIG91dF9zaXplLCBkcnZfc2l6ZSk7DQogDQogCS8qIElm
IG5lY2Vzc2FyeSwgYWxsb2NhdGUgYnVmZmVyIGZvciBpb2N0bCBhcmd1bWVudCAqLw0KIAlpZiAo
a3NpemUgPiBzaXplb2Yoc3RhY2tfa2RhdGEpKSB7DQotLSANCjIuMjUuMQ==


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwPkZyb206IEZlbmdXZWkgJmx0O2Zlbmcud2VpOEB6
dGUuY29tLmNuJmd0Ozxicj48L3A+PHA+PGJyPjwvcD48cD5Vc2UgbWF4MygpIG1hY3JvIGluc3Rl
YWQgb2YgbmVzdGluZyBtYXgoKSB0byBzaW1wbGlmeSB0aGUgcmV0dXJuPC9wPjxwPnN0YXRlbWVu
dC48L3A+PHA+PGJyPjwvcD48cD5TaWduZWQtb2ZmLWJ5OiBGZW5nV2VpICZsdDtmZW5nLndlaThA
enRlLmNvbS5jbiZndDs8L3A+PHA+LS0tPC9wPjxwPnYyIC0mZ3Q7IHYzPC9wPjxwPmZpeCB0aGUg
Zm9ybWF0IG9mIHRoaXMgcGF0Y2g8YnI+PC9wPjxwPiZuYnNwO2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
aGVhcC5jIHwgMiArLTwvcD48cD4mbmJzcDsxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSk8L3A+PHA+PGJyPjwvcD48cD5kaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1oZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYzwvcD48cD5pbmRleCAz
Y2JlODdkNGE0NjQuLjk2Y2I5YWI1NzMxYSAxMDA2NDQ8L3A+PHA+LS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1oZWFwLmM8L3A+PHA+KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmM8L3A+
PHA+QEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0aWMgbG9uZyBkbWFfaGVhcF9pb2N0bChzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IHVjbWQsPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3
aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPmluX3NpemUgPSAwOzwvcD48cD4mbmJzcDs8c3BhbiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPmlmICgodWNtZCAmYW1wOyBrY21kICZhbXA7
IElPQ19PVVQpID09IDApPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUi
PgkJPC9zcGFuPm91dF9zaXplID0gMDs8L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpw
cmUiPgk8L3NwYW4+a3NpemUgPSBtYXgobWF4KGluX3NpemUsIG91dF9zaXplKSwgZHJ2X3NpemUp
OzwvcD48cD4rPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5rc2l6ZSA9IG1h
eDMoaW5fc2l6ZSwgb3V0X3NpemUsIGRydl9zaXplKTs8L3A+PHA+Jm5ic3A7PC9wPjxwPiZuYnNw
OzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+LyogSWYgbmVjZXNzYXJ5LCBh
bGxvY2F0ZSBidWZmZXIgZm9yIGlvY3RsIGFyZ3VtZW50ICovPC9wPjxwPiZuYnNwOzxzcGFuIHN0
eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+aWYgKGtzaXplICZndDsgc2l6ZW9mKHN0YWNr
X2tkYXRhKSkgezwvcD48cD4tLSZuYnNwOzwvcD48cD4yLjI1LjE8L3A+PHAgc3R5bGU9ImZvbnQt
c2l6ZToxNHB4O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7Ij48YnI+
PC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTRweDtmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsTWlj
cm9zb2Z0IFlhSGVpOyI+PGJyPjwvcD48cCBzdHlsZT0iZm9udC1zaXplOjE0cHg7Zm9udC1mYW1p
bHk65b6u6L2v6ZuF6buRLE1pY3Jvc29mdCBZYUhlaTsiPjxicj48L3A+PHAgc3R5bGU9ImZvbnQt
c2l6ZToxNHB4O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7Ij48YnI+
PC9wPjwvZGl2Pg==


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--


