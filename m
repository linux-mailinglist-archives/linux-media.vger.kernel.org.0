Return-Path: <linux-media+bounces-1644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2600804D0C
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE5C1F214B3
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC7A3D3A5;
	Tue,  5 Dec 2023 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="snfPuOVp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB2BC9
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701766886; x=1702371686; i=ps.report@gmx.net;
	bh=udSS96naN1uCt3CFBjB4Z/lVsvR+4SbxAJ3aS6Y3A3M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=snfPuOVpwwYlrA9NZh7RdRZjucKr7CvfHLYQ4Mat6LYxWsRR9dmeIU7+T2+ZUdKD
	 j4VdNqq8vfTP1+QEejO2M+1692FmjpAgcq3BRz3w1t4cLAiCvtT9iZC68L3fQwLct
	 y3pBQiBHPB6Zng6EBA7JRk5L/XKkqUBDX/dPTm39IWLAYlixAuxrc3XjtLFtoErXS
	 H558ykvVHeqyovg311T+C9X5W69EqyzasZ89Ym6KXN2Yd7/xbubtF5LkACSjRyQJi
	 Ajyv8fB77Pm346DB71TW4k7TDhijOoKCkP2mBFun6EimUhrzoM6XKP4fIKPF3WCx7
	 hTMFK90sGpRYzMbhpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.163]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDQeK-1qzwuG1dR8-00AY3o; Tue, 05 Dec 2023 10:01:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1 1/2] Revert "meson: v4l2grab needs libv4lconvert with fork support enabled"
Date: Tue,  5 Dec 2023 10:01:22 +0100
Message-ID: <20231205090123.12983-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:4cdvgrMzQmDDuFJR2yFWxvCrhCrLbHJLxyrWuw8s+Jes99DPtdU
 RFYuIZ8QdSuBrjbxcsbx/iC0geZGOhsn0QyMIgI2+m3rXEk4Z6DFRwPDPAxrWPkR+DXBLOx
 GhBfaN9iMgfDRjHb0OPu+hxoqaDuDY9zkxpjUDpeXQiYHQ0qe9Z82Oswr6P9o656hcRFKya
 w2qvudgXhwUY3wzdu8/DQ==
UI-OutboundReport: notjunk:1;M01:P0:d1CyhJD2PpA=;GHj/9SJwdafAuNKiqQD0esedfxu
 laQfzSYhWzAl2+OLnWKQHGawD2jFOgWBCGpcG26/gazVSgffT5HhwfSfhxdhxuG8B23QKMk6V
 H5bjq4ig62rGeOdoAeJPMdosWaoj/yerj8Uj+bU5k4eV+gHKmspn9kl2Hv5fPCmeVn798VhuW
 mu1WP2slqX2kdtd+pMKtkLyTe49xVHQjHtmvgKPSMbFwwvwEjWiQvA1GCqq+Qr7ZYohc/PLkx
 9IEe4X822P7ZohY7eGvNt1o6dVYd/BqOsWLJ+eU1OQj4wi6geTBht2Iz1es2ef+MrvOZBByvd
 4c2AsZf6eOiG5nBGwUoUscGVxbqjh/5/q2pMZxzxxArCdGhftA1k1GkkUvvbDOG58yGDmYNzW
 i5ahE+ciqp83i+VgMozy0dW8kfXrXe2RTi76jOrNvGHGGvXFIk2ev60+ioIr3ukfvsAVmRrav
 ZFL3qIfupLwZHKTunHcSO7gJhOvZ9D6QbKrydCUN7dzyj6YUr+E0ABZBQsR8LoSzCvpvRCve4
 zbVC9R0kDaaDDXWFBgJ8BqM1HRL+df+JKuqTL8rKT54wSK1cxWbXfcdtz7YMza1jrjzCqNVzJ
 2HfVpqnP/vQeZmvDptm8WfuDQSxxt0k2uEYVk14F8rEmQdY0EutYphiKIuULxkZzeEzi4i7DB
 5sv2OMwvuhDxxnTINneYtqiTkF2kerE/YFHlObQiwd/RcTdnk0hksVTCRxUe1s+Lx/dS39aOB
 7KMoYSpzyZi6zBPEcRRhrWgblc5RoS4Nz9FVScWIQ/tZfeowz7yNJIyqQcTAeXKoW98j7rb9n
 NFu2cxoHrC4k0Vhxji6SGr2RDpQ1VLpM3jqHqbDAUqeBAOwUjmZ49kniD0Q4Mdf0aq+M/1e7h
 g28/HSnSXBYUZDQRrpc9SXtdEOP/JmdyybWn1MQWFgObNGlVJ+DX9IGh90zibdFzRzNtaJG15
 7JqztWrXac8TWAaQbKkWggVZ8sg=

VGhpcyByZXZlcnRzIGNvbW1pdCA1ODlkYTUxOWUyMzBlODRiMzYwM2RkZGFiNDI1NjE5ODNiMTQ2
OWFhIGFzIGEgbGVzcwppbnRydXNpdmUgZml4IGlzIGF2YWlsYWJsZSAobWFrZSBsaWJ2NGxjb252
ZXJ0IGhlbHBlcnMgZGVwZW5kIG9uIGZvcmsKc3VwcG9ydCwgc2VlIGZvbGxvdyB1cCBwYXRjaCku
CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQog
Y29udHJpYi90ZXN0L21lc29uLmJ1aWxkIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvY29udHJpYi90ZXN0L21lc29uLmJ1aWxkIGIvY29udHJpYi90
ZXN0L21lc29uLmJ1aWxkCmluZGV4IGMxZjQwMzU0Li4yOWI1MWRmNiAxMDA2NDQKLS0tIGEvY29u
dHJpYi90ZXN0L21lc29uLmJ1aWxkCisrKyBiL2NvbnRyaWIvdGVzdC9tZXNvbi5idWlsZApAQCAt
MjUsNyArMjUsNiBAQCBzbGljZWRfdmJpX2RldGVjdCA9IGV4ZWN1dGFibGUoJ3NsaWNlZC12Ymkt
ZGV0ZWN0JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzbGljZWRfdmJpX2RldGVj
dF9zb3VyY2VzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluY2x1ZGVfZGlyZWN0
b3JpZXMgOiB2NGwyX3V0aWxzX2luY2RpcikKIAotaWYgaGF2ZV9mb3JrCiB2NGwyZ3JhYl9zb3Vy
Y2VzID0gZmlsZXMoCiAgICAgJ3Y0bDJncmFiLmMnLAogCkBAIC00Miw3ICs0MSw2IEBAIHY0bDJn
cmFiID0gZXhlY3V0YWJsZSgndjRsMmdyYWInLAogICAgICAgICAgICAgICAgICAgICAgIHY0bDJn
cmFiX3NvdXJjZXMsCiAgICAgICAgICAgICAgICAgICAgICAgZGVwZW5kZW5jaWVzIDogdjRsMmdy
YWJfZGVwcywKICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVzIDogdjRs
Ml91dGlsc19pbmNkaXIpCi1lbmRpZgogCiBkcml2ZXJfdGVzdF9zb3VyY2VzID0gZmlsZXMoCiAg
ICAgJ2RyaXZlci10ZXN0LmMnLAotLSAKMi40My4wCgo=

