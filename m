Return-Path: <linux-media+bounces-29985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB7A84E58
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 22:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697B99A6F9E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 20:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E293290BCB;
	Thu, 10 Apr 2025 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JxG6BeoT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D67D1E9B1C;
	Thu, 10 Apr 2025 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317841; cv=none; b=on40ajq3scUReBjUrd57HLbvKbfO1LoYgzXNWLL/qdaRDw6mqNwyut88a7Zidwa5MbRlEm4eMjnwg++6Plnv4G9gQesBjajUL+ayhsqSypL8mH9QWxjq8elUi1yynRcToYMeqctQ1W1nylv28qxtf1RFkBQYfWD/La+Lnpz19Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317841; c=relaxed/simple;
	bh=vJ8EiL0hmwcVbWdqhBOaXhHV5l0Yjwz/a+XF1kwMG7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XVhGiA0uFWwGDSvaap50MJTuvsfN97SG1jUio56ojji5gDtKPoOkDw87qsTItAtVGcizcwaEVbn+JV1+0z+HAOYLnYXURUpA7NBojxIjy/mg4xrml7YBYpSKpcvA2lscamsUJOIKFiVpf8uOq3qNEMkPxZSBXScrpKrybts9+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JxG6BeoT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744317837;
	bh=vJ8EiL0hmwcVbWdqhBOaXhHV5l0Yjwz/a+XF1kwMG7A=;
	h=From:Subject:Date:To:Cc:From;
	b=JxG6BeoThCmfdGL9UiTYcY0/7v02JHjf1fcCXTo8o4rTtJsBGqSPsjzHmPLFHr70/
	 diAwsmsqEbyDz2wc8OUPi3+1IV2+4fyNMNFjwpSeLGD71aIeqhMaZyqSYiaqFbEorQ
	 r3C1zMq2uBSPAx/D6k+iewVl+ARPBqMs4gXgnUmSt8EsOZ5qBSe72kZzuzNH4ZeEWK
	 CaMKQQiUNYscB+NLxZHkEbPdWMqtHVWII7D58D/eQ+lW/2VayRlL4/b9bfzRuM655n
	 E7YRs/Kr/1OGBmOFTOKr/CHFTPEl0C5vvNEsENDm2MVRUAwpcGE8GKpRrrLz5yiMsG
	 /CRqv/24h1ONQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B54317E0808;
	Thu, 10 Apr 2025 22:43:56 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 0/2] media: synopsys: hdmirx: Report frame drops
Date: Thu, 10 Apr 2025 16:43:45 -0400
Message-Id: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEt+GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0MD3aJsY1MLC92MlNzMogrd4tTC0tS85FTdRBNzgyQzA5MUQ3MzJaD
 mgqLUtMwKsMHRsbW1ACxnc2hoAAAA
X-Change-ID: 20250410-rk3588-hdmirx-sequence-a470b604d176
To: Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

Frame drops are common problem with live captures. This is most of
the time due to buffer starvation introduced by userspace. The
v4l2_buffer.sequence allows detecting gaps (drops), which allows
userspace to report it. The new HDMI receiver driver on RK3588
did not report these properly.

With this in place, drops will be warned by GStreamer notably, with a
trace similar to:

WARN [...]:<v4l2src0> lost frames detected: count = 1 - ts: 0:00:03.063493047

A QoS message is also sent to the application, which can be used to
gather statistics.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Nicolas Dufresne (2):
      media: synopsys: hdmirx: Renamed frame_idx to sequence
      media: synopsys: hdmirx: Count dropped frames

 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
change-id: 20250410-rk3588-hdmirx-sequence-a470b604d176

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


