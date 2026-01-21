Return-Path: <linux-media+bounces-51194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDPmI1KRcGljYgAAu9opvQ
	(envelope-from <linux-media+bounces-51194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:41:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C4E53BA2
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7DC96C1AA0
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B814611E7;
	Wed, 21 Jan 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="K8bdRLWt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD743CEF2
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984566; cv=pass; b=OdZE/t8S0f7xrP5e9Psdso2ak4iKMozGj9GJ/bzhj9+Z0jnV2UgTcVxfmt4o1Y9LdLmAnhwZyBR22Y5D0mllig8vfjfXzwYnz+gzD1y85OcIB7yAAS17mJTRq49Ys5pBo+otEi3hAI2pT1cNWWpDggO2KN0x9d1uXtGHRI2VbA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984566; c=relaxed/simple;
	bh=a0bsGQ65fDUppa/U+1CZVwbpFSRnfFUsLG95i1yZH8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQE8eF3nUguHGe/ze9ECCEh5pXIYgU0FH+1UeEVpM9v3GNCQb3SPqhtocefqh8MSfQEVNYVO1mUiOSmHJJ16tb5e1nA4Bm9ES3ErKye85nQNJZTPagRNhSLpv+SoWXrkdDC2mIQfPXHhbcGYc2u9GusqTFZOIAZdAZBewUN8bKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=K8bdRLWt; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dwy5n72GNz49PyQ;
	Wed, 21 Jan 2026 10:29:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1768984142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=lag1T/1HtJKX1G4oTyuhEM1yhY9zldfsf2D79dS6Q5Y=;
	b=K8bdRLWts4QgbBgwRYovO9oClpC44F7JhJLcnD4ErFgAW2Q/ZYGlGHq5CPs54d5hj0uvSd
	QWx14FgyWQ2aXd4s0VNd/kSqawqUErfVY+7zItIc+GbWDDjKIaA6R78pwg/WODUqzsGamy
	AJ/RKuQszFQKZLgrNFJhy5d0mpxut3tgdXv1PyyvjxFTWTeJS+eMjeXpsr87pKSl+cIGU/
	IYoER9DANYdB1PE8MkxZp34Wb9oMQ3WJkvXQlbFLKYrZe7iiUqzNfE0pXZkWNWjz4Y3DHn
	CpTSrZt+NWBZ5FsBRcyaYQXfDo8pcvxQaihcIDLWsorzkaOwfZQtFggtEyNMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1768984142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=lag1T/1HtJKX1G4oTyuhEM1yhY9zldfsf2D79dS6Q5Y=;
	b=Np21/V4svn2juX9sSM/nmXWoGzZRDkWg4ASt/DB6EK8BcknN8dW0QYi1yCD0Ql4KfZd7EY
	5SCOn8PCxQKAdT814ZPvi0TrzZozwRgliIr7D8+dSGgbda3nMuH7dz24cu2GVcR5FjVjzJ
	KFqBg9F0OX8Z0ycIeF4IGMyOzkBf10vlYALJpIEY1uWarflK5+bQJCSO782ASQGlZMVxdG
	d5uAPccIo6QLmUuaMULGIr9+LL/eq8eYmvk3XzgYAk2hn+CYnFkS7pVPWVBExZrju3e+9+
	yvvmFYiUYqcWZOfiuq3csHDxXBUE56TkpXs32CbSqRrFI4rgckD/ZZoDRb/ZnA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1768984142;
	b=MNgYMjNWN76gWqF6/jjYhphQHr6RNvUg+eDy8R/1MXxzwROH9g65+e6Nux4pZUq+F7ipj7
	QrvvMM6ah94bXr2rEZK6uyULD1pIaFwS6U9zrLgrqQS+3TARIetBcfYXOVVg0dLPhj4uui
	CizhhIMAWQghY/Yr7X2Saudch7SmAq/apDzHLQJiosvz0u6Ojx53orD4f5KX83nUQdxFnc
	1Pem1Bo1D1DJsev3Ji19Z/lTPuKjkKZn/e0hg3z09TyvlD6pcfxvagKqFEHdNn1eoTC4Kx
	MybqUFU4ovUADzu0bDkR+ezbX/ps/L7eSsw9s9cnDrVbYoW14YfoOyTjs9HWlg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6CE42634C50;
	Wed, 21 Jan 2026 10:29:01 +0200 (EET)
Date: Wed, 21 Jan 2026 10:29:01 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.20] Synopsys CSI-2 receiver driver
Message-ID: <aXCOTYy9xh6h5DX9@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51194-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,valkosipuli.retiisi.eu:mid,iki.fi:dkim]
X-Rspamd-Queue-Id: F1C4E53BA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit dde659d37036c6edf5eeef81274b43fe12dfad53:

  media: iris: Introduce vpu ops for vpu4 with necessary hooks (2026-01-20 16:22:24 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-6-signed

for you to fetch changes up to 063befb259f3efeb0119f3853efad3b17d3e3f3d:

  media: synopsys: add driver for the designware mipi csi-2 receiver (2026-01-21 00:59:51 +0200)

----------------------------------------------------------------
Add Synopsys CSI-2 receiver driver for v6.20

----------------------------------------------------------------
Michael Riesch (2):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 ++++
 MAINTAINERS                                        |   7 +
 drivers/media/platform/synopsys/Kconfig            |  18 +
 drivers/media/platform/synopsys/Makefile           |   2 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 722 +++++++++++++++++++++
 5 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/synopsys/dw-mipi-csi2rx.c

-- 
Sakari Ailus

