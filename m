Return-Path: <linux-media+bounces-58131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPt3JM8r1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C93A7A88
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09289304DE9D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9341B39DBD7;
	Mon,  6 Apr 2026 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orp3nQpc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1539D6D2;
	Mon,  6 Apr 2026 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512510; cv=none; b=dsDsVxsI0k6szDPZKzB3SVdkf9n05VKgMxgOArDetNXH3wAhUrwQmX2l948C9knNI/dHG6sTUqTUKXn1Lg03zZJjaLR45hIWHRK9dM/Y6eHylVtwP0xKBvX8QtSvuEJD6H78/IWo2iDlSF1BnJs/ACDvmt8hoH62XYLRMfQmn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512510; c=relaxed/simple;
	bh=xvXwQ7SyVq10qPxOZ3NOQ8AJe9OtXIQfYkcWIcJE+C4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LEpL6AO8rEazQ8ZWPpc1OZ/qpjqOiWmHw1WvgvE/UR/GvyU2CjXGQN0+1URAP8RMIJ2nx0uwVGf5QpnGGqW00s0SH8W0SZDDpQDCUFXsPipUB0uteZZZsMWUe2IeERGd85NiOIG68l9+hJE78Ym2T4PThbfAPlS0C4BaC+RlJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orp3nQpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C10C4CEF7;
	Mon,  6 Apr 2026 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512509;
	bh=xvXwQ7SyVq10qPxOZ3NOQ8AJe9OtXIQfYkcWIcJE+C4=;
	h=From:Subject:Date:To:Cc:From;
	b=orp3nQpc6cxsYKq9cP8K1mIia8TrRRBA/X9EDEdrUQUrw+O14xwQirgu0ErVqfuw9
	 rEYyKQFHca9JgkjHXlzyMHkc79FWEvOWuUzIXup3dkMljw1FxN1K3hX4lbCd8Bm04A
	 VcyT7iCQjviihM/a8VsJWEmTnQaaBRTOx3RgudJDxvZF9ldF+p2Rk2j32iRtAfyskr
	 o1bbD47h8xDWhHxdmjCvl3ZNa81u5Yqcw7XLkmOFl82sE7XDm4TVexO4bGFO5or5dL
	 cBVBKLidSjG3VwHuaxMcPJGTuMQ6cPcSsjz7xhBD1hguxqe+VSPqRmQTEqCZqlHI1p
	 i53k2ff5aU0mA==
From: bod@kernel.org
Subject: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various
 CSIDs
Date: Mon, 06 Apr 2026 22:55:00 +0100
Message-Id: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQr1GkC/yXM0QoCIRCF4VeRuW7AFXGxV1m6MGdqJ8jCaZdAf
 PesLr8D52+gXIUVjqZB5V1UHmVgOhjIaypXRqFhcNYF623AnO6qWEnwIm8kojlEHy1nB+PzrDz
 mX285/a3b+cb59Y1A7x/7kuMgcQAAAA==
X-Change-ID: 20260406-camss-rdi-fix-ddd769490ec2
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>, 
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4109; i=bod@kernel.org;
 h=from:subject:message-id; bh=xvXwQ7SyVq10qPxOZ3NOQ8AJe9OtXIQfYkcWIcJE+C4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu3KfdmvlDsDs6KYKVLLriBXDjqccgcqz+sq
 PTjDym0mZiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQrtwAKCRAicTuzoY3I
 OkxED/9RhYzzvT+2B8vUZTeoR/CMxCrFaoFMY69CLlIi14BkZQhsH1aju+wHfP7klTJShN9Z+eR
 Ktqp/aL93l7j8+/f7i8HfAyfDNC+9WlzUZOa7x4b6bQxePL8V4xxpCgPbhLQVecFmwMkqcn02z+
 iO/1JWIjqg2taH7CHJcCukNSr/Af+OIOULMe6wJ5YAUFBq67HH/+44vFF/zUVQ6SGGwvFDmyodm
 cFw8tdp0vQEHrd+/50u+mnz+YZUm8haTBYns4AR96zxR1mr+lVmxTqn4rJBadNjvR4PUFCpzehX
 hA9MB+qhcuHggz2WJpjcObirakbDMbrpQ/1HjRlVzqVndYY+kcgnfqB5k5Boe8kL4LmMv4iNe4l
 VWCRpCDjCLdXcWw8C7uLqVdoQDfv27LohpVTPaqVD7pTDTznYlgukGVVYWlVx7oeofDBTLYGMWt
 gb+1iNLB/m8hB6F91FE+ajGMQi7tGjEZjALpIP5Obc0bZ1kg+yNOHP87SCm3f6jbfUgl5AkHH/E
 W1VseYJqhTnpWz7gCTfSGpYkPZxXGB55vD0A4p+a0kEJ+XojBTUeKKhnXbVgjc0mcNa+lT++3CK
 +k3vU+0UO4huSiviSJV2jXeE+fdMPHcmS29LW3Be8xrNANRmlGE4MlS1ArKA3CTvzB7G91TYPwA
 lPRl0dZwXO0nx0w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58131-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE1C93A7A88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A serious bug has been copy/pasted from CSID 170 into various different
implementations of the CSID.

In simple terms we have a broken model of enabling virtual channels which
needs to be rewritten.

Taking the CSID 680 as an example. The CSID can output ports RDI0, RDI1,
RDI2 and PIX.

Each CSIPHY can connect to any of the CSIDs. Each CSID has four output
ports RDI0, RDI1, RDI2 and PIX. To get Bayer statistics going we need the
CSID to write on the PIX port.

Each of the RDI/PIX ports can process any valid virtual channel.

When adding virtual channels a spurious association was made between
virtual channel and the above mentioned ports. In simple terms

vfeN_rdi0 will always be fixed to VCO
vfeN_rdi1 will always be fixed to VC1
vfeN_rdi2 will always be fixed to VC2
vfeN_pix will always be fixed to VC3

What this means in practice is that it is impossible to route a sensor
driving VC:0 to the PIX/Bayer path in upstream.

Given we have now gotten a mutli-stream support in the kernel upstream we
should move to that API in CAMSS.

First up though is to remove the breakage of invalid VC constrains and make
those available to stable.

Here's the practical example on CSID680.

This works:

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video3

This doesn't:
media-ctl --reset
media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_vfe0_rdi2":0[fmt:SGRBG10/3856x2416]'
media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":3->"msm_vfe0_rdi2":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video5

The PIX path - Bayer stats requires more work still but in simple terms it
needs a pipeline like this:

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_vfe0_pix":0[fmt:SGRBG10/3856x2416]'
media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":3->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -p

yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video6

But that can't work with the above sensor because that sensor puts out VC0
not VC3.

Constraining the CSID/VFE ports to individual VCs was never the intention
and since we have v4l2 subdev streams we should align CAMSS to that which
will ultimately allow us to map any VC to any port without _requiring_ a VC
to enable a particular port.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (5):
      media: qcom: camss: Fix RDI streaming for CSID 680
      media: qcom: camss: Fix RDI streaming for CSID 340
      media: qcom: camss: Fix RDI streaming for CSID GEN2
      media: qcom: camss: Fix RDI streaming for CSID GEN3
      media: qcom: camss: csid: Rename en_vc to en_port

 drivers/media/platform/qcom/camss/camss-csid-340.c | 17 ++++----
 drivers/media/platform/qcom/camss/camss-csid-680.c | 28 ++++++-------
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 48 +++++++++++-----------
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 32 +++++++--------
 drivers/media/platform/qcom/camss/camss-csid.c     | 10 ++---
 drivers/media/platform/qcom/camss/camss-csid.h     |  2 +-
 6 files changed, 69 insertions(+), 68 deletions(-)
---
base-commit: 2211e826bd69c041534093735241182013dde7bc
change-id: 20260406-camss-rdi-fix-ddd769490ec2

Best regards,
-- 
Bryan O'Donoghue <bod@kernel.org>


