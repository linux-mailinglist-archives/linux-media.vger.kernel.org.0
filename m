Return-Path: <linux-media+bounces-57147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBJdOjA3xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:40:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E096433624A
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 013AA30596F1
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD6C2DCC1C;
	Thu, 26 Mar 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Lirmpt0K"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A40225A38
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531315; cv=pass; b=UJEW3jZtoL0MOHKkrkxStHJT5e1LVjO7TYJ9H24sLbQevzA2Q8KHUjeSvODnCrJwKbT9cF84oC1YAedVjouSF0HhcDVaMzfyTiXgslwKP/yQ+PH14r7JbQzlLNAkm3vCbmN/9l6G1pqftEmSBTQEJvk7dV3lwmNHCdH7YkrwQHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531315; c=relaxed/simple;
	bh=mCmVd9aul+r8EDZrGSdTbKPlKGYo4JNA6n9j5epHUaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsGrWbKNef7V/z20OjmJhsNCO/oJMaZqRSPd7SzjsF1nij8Qe1NnAJDUdEbtcf4XtsZrtr1Q1MjFXcaWJq2vos2fmhSVTZepVlPo+i/1efTZlcgFKb535FMn++TJ9iQTwHxUgDHJa6CSAujVlASMW9dDTVuEDjz0GRgANBnTiUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Lirmpt0K; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fhPYx5Cykz49Q5S;
	Thu, 26 Mar 2026 15:21:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774531301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=6uU7osv9y/SJgxhsHDiEUWu7NpZMFWvxYxhiOcQkB2o=;
	b=Lirmpt0K/mcq7Mp3aGszssFsYW7IYHFSbXlEplfUDzpxP9nT0c0nSXhb3ecC1VcD7GaqO3
	ylSVAFj9flq2tWKlmwOac3pkjWEZH5djAaR5T22p0yfH+CbW0OZQniEDZaEWPPjJjxQTOU
	OEPWBrVU0rTWQ3TX7Eaq8yViq8Swzs52kEzGelZOCpAd0b9pT+Qq4iF0ZRFYHTjBLVhZ/n
	5ldwvKwkjuiMZ1XAFQ1LzuXo+7zkPqIi+HJJwDGEPEGUVQVxuvDMpSr7499m70upY3OGQ5
	4krdOieOFY15JSgrNy2dqIdq9lXQrAjinfBDnPN7EhOO/S60snkTHREEyvg/EA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774531301;
	b=UuRCoSy1663kimLKJBlu+K4QZC486dmOMU35F3H9LiH2tD479a9T285nS07bY2i3LJCNIR
	HUHHinwAUyS+1LERmMvOjCu6IxWpJ9c244U9jyqVPQAKDM1jw0ROt9lEOidsEgCM8QyFf9
	EQ84+iCevPkIcr94VOluoY4azO8TGdXxRVcUmWWf/Iw5xIDlD1IVW4NfCafs9p7TDc4KPs
	9dZ2sfOsEQFt1Me4KH3XnltY4JN+t0++xd3FxnwMk9t+muZNHmXxq7rsOKKBtiNs9xfyyL
	XUboxqFDZpHVWwvQZRGnhmGe10zX55donv9cuktNpUFrOOsGL+IMfvIyQ1N85Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774531301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=6uU7osv9y/SJgxhsHDiEUWu7NpZMFWvxYxhiOcQkB2o=;
	b=hIaPSzJAmw9JhduMo9qNy6Kbm1njzxGKHH+w1xD8l+cD8UP9kg78C16HBDXJX4uP6pq7L2
	x4mBRTo2z9KPgrCrv4dBnoEmKLl1df7hOqgZVdc4Cq6gbSZF5t76LlTwg9DVjlrRNH7snU
	O/PG1XS6Ad90JACj+D2SsiTTjz4RtetHTqWmAe3VUJvwx+j3+FFmKao1MQonbPT3016hCs
	noxpMOfvtVST2iiwFa/PwrHrBOaz7J67vrf2Pn4riqKfIrf48PQbty/dNt/IPUoseeTSDC
	/Nh6Yz3wuN7277b8v9esGcZAfg2BmNpCJmI63dvitGXHgp/8NSP0EIzITBLtQQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0A9BB634C4E;
	Thu, 26 Mar 2026 15:21:41 +0200 (EET)
Date: Thu, 26 Mar 2026 15:21:40 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 7.1] V4L2 patches
Message-ID: <acUy5PBbPhDNTWDG@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-57147-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iki.fi:dkim,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: E096433624A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit ebeec2b000a90cd8aae86d1931ff5ef23af8284e:

  media: staging: imx: configure src_mux in csi_start (2026-03-25 18:42:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-5.2-signed

for you to fetch changes up to 0f7c2d77f2ed2bdbb4c007913a220335558447de:

  media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible (2026-03-26 15:18:29 +0200)

----------------------------------------------------------------
V4L2 patches for 7.1
- Update IPU7 driver TODO file
- ov08d10 fixes and improvements, including 24 MHz clock and DT support
- Non-contiguous clock mode support in imx283
- Synopsys csi2rx driver fixes, NXP i.MX93 support

----------------------------------------------------------------
Frank Li (6):
      media: synopsys: csi2rx: use devm_reset_control_get_optional_exclusive()
      media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_all()
      media: synopsys: csi2rx: implement .get_frame_desc() callback
      media: synopsys: csi2rx: Use enum and u32 array for register offsets
      media: dt-bindings: add NXP i.MX93 compatible string
      media: synopsys: csi2rx: add i.MX93 support

Matthias Fend (10):
      media: i2c: ov08d10: fix runtime PM handling in probe
      media: i2c: ov08d10: fix image vertical start setting
      media: i2c: ov08d10: remove duplicate register write
      media: i2c: ov08d10: fix some typos in comments
      media: i2c: ov08d10: add missing newline to prints
      dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor
      media: i2c: ov08d10: add support for binding via device tree
      media: i2c: ov08d10: add support for reset and power management
      media: i2c: ov08d10: add support for 24 MHz input clock
      media: i2c: imx283: add support for non-continuous MIPI clock mode

Michael Riesch (1):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible

Sakari Ailus (1):
      staging: media: ipu7: Update TODO

 .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 ++++++++
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  55 +++-
 MAINTAINERS                                        |   2 +
 drivers/media/i2c/imx283.c                         |  12 +
 drivers/media/i2c/ov08d10.c                        | 246 ++++++++++++++----
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 279 +++++++++++++++++++--
 drivers/staging/media/ipu7/TODO                    |  12 +-
 7 files changed, 625 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml

-- 
Kind regards,

Sakari Ailus

