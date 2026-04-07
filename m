Return-Path: <linux-media+bounces-58176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOd9Ftfd1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:35:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B33ACEC0
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 594A5300C01C
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86603A9637;
	Tue,  7 Apr 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOEVKkxU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A72F28E3;
	Tue,  7 Apr 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558100; cv=none; b=ivi3aH78HDskeCudJmVjqtokvQwv2iSxFM3uoYab3dDDzbvyM+gq2KVhzG9/u+Cc4+hRgyJ6ybEZGJJ66Qg90DIkB9Ciz762uNlxpqou4MEfJvQhqkkQpftFI7OSN41gqiziIk6N/GFt5qd1QFdmLLDppTEWLmuB8NqQgvy1JXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558100; c=relaxed/simple;
	bh=nW2uOyRMEK9vO/zhTYymlFVGNQoC41JH5OJ99DlhzQA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K1LfyPA4IUJ0Q+Y6L+aF/ZNTnI8fQE/5Iv33C7HJlBkS62lEsMp9Yl5PpOlvMrBF4zxxNpFAQleWBgEgXQ7o4+RSixB1oajWAVmhn19tHDcvS863E5x0+QnI213YcFyuQM2dnZfiwa13Ta9DcZ+aB49O1Y/g3VOQKuKzdQ6lkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOEVKkxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E33C116C6;
	Tue,  7 Apr 2026 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558099;
	bh=nW2uOyRMEK9vO/zhTYymlFVGNQoC41JH5OJ99DlhzQA=;
	h=From:Subject:Date:To:Cc:From;
	b=pOEVKkxUyhdvgQPPfNpuPwu6j4x+wY74x5/CuNCyD931N1NYwqFzQ91n5D1lLWtUa
	 dWKbIvOCGHBtMiuXfThn80I98VF8ReZwe+MU2xmsx0iP+e5sGNuJJdfXVFhah8RWNa
	 htpv3ty12Tw1hgAlLWpajM+HTFk35wzuLj4Q9K/0BD+Dv9XfX80P9bBIaJa74Lx3nl
	 EqMdD3P3JszRofHriIRN1p/JVC5aDMMibodiGsBPMUnkNGzVmF//YyhPwtMSlnSOPd
	 yFUOsigr64WrlvnVEszWavUXGVrYDklVt9solIY5/rVq1nbfCk9KPdXkhMDMgqZi0x
	 c+NYUOLNekiVw==
From: bod@kernel.org
Subject: [PATCH v3 0/5] media: qcom: camss: Fix RDI streaming for various
 CSIDs
Date: Tue, 07 Apr 2026 11:34:50 +0100
Message-Id: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrd1GkC/3WNzQ6CMBAGX8X07JqlkCKefA/jAdot1B8wXWw0h
 He3xYuaeJzNN7OTYPKOWOxWk/AUHLuhj5CvV0J3dd8SOBNZSJQKC1Sg6yszeOPAugcYY0pVFRW
 SliI6N0/xvPQOxzfzvTmRHlMkLTrH4+Cfy8OQpd2/dsgAweR222SyKHOD+zP5ni6bwbcixYP81
 MtfXUZdKau0QrTa2i99nucXs994d/wAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4603; i=bod@kernel.org;
 h=from:subject:message-id; bh=nW2uOyRMEK9vO/zhTYymlFVGNQoC41JH5OJ99DlhzQA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3Nj83R/kBxjoTW54lTpb96z90G7bHMmPopV
 OWc7mIU3nKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzQAKCRAicTuzoY3I
 Ov6jEACJFnSHRyfstZkDk3QdNFs7MugAUuCPmaiGhKBZVqgFuKKvaUutpZ8x86EnXqoS6Hm0lA7
 7U1YTmIwkWbz2uKcHhvOBEoveqY5CgqEKrW5CamWk3mrkD7JbH/OAZqCfK/P14biBvn3U6/qZO6
 7k2hvhkGcAkAfvxJWw4KjQLC5Hnyw3wBJpkBRQtXrm5vSqGTKwfleqUrH5T+lV9DfJMJLo7Zi06
 5+G76b/OagCrYuWy1PUjCFPq5EWUHnFY1xD9TUfWzrES7TfOQutT0kt+06cV3fFhA/8UYKr4D5X
 G6HsNK6vEpwZWP5c93rp8KMnoO/hGlUWuNnO+15xeAj3aLZH8fltIbpnFJgGCQukecyoY2JJxiZ
 0+tv0t6OlQw0xQLMlotk3Xxa659hRlywzX2INWfcAjh7ibflRJ7GIDx0rIU5wI/HuoOYzBygXlp
 Eg8bIQFq2zEdRAnURmJZrsZIlJKJlk+O1oeszYI2S9Y7U4RbFQSGzg5gzKamF6Dok9hl6DwiNkC
 P6qGgyYyADRkik7rPTvN4FHxXaQIewlG0OUATMI66O4mFxyMsWQwUAi+WYTS9PHAFrgHjd2ifkM
 Q6sIfQfchR12LjM6qSukON6g9v9QvMSJSjsRfao53/seySpZVmD7bfHtaiAZIEbqpnc8Cl6qBxJ
 kw7/0sIyH6AXUFg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58176-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE9B33ACEC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v3:
- Missed one instance of using vc where I should have used port csid680 - bod
- Updated the comment in csid-340 to use port instead of vc - bod
- Link to v2: https://lore.kernel.org/r/20260407-camss-rdi-fix-v2-0-66f6c600fcff@kernel.org

V2:
- Implements Vlad's suggestion to update/include comment in loop
  for the Fixes:
- Puts into the first patch Loic's suggesiton on VC+DT 
- Link to v1: https://lore.kernel.org/r/20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org

V1:
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

 drivers/media/platform/qcom/camss/camss-csid-340.c | 20 +++++----
 drivers/media/platform/qcom/camss/camss-csid-680.c | 32 +++++++-------
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 51 +++++++++++-----------
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 34 +++++++--------
 drivers/media/platform/qcom/camss/camss-csid.c     | 10 ++---
 drivers/media/platform/qcom/camss/camss-csid.h     |  2 +-
 6 files changed, 76 insertions(+), 73 deletions(-)
---
base-commit: 2211e826bd69c041534093735241182013dde7bc
change-id: 20260406-camss-rdi-fix-ddd769490ec2

Best regards,
-- 
Bryan O'Donoghue <bod@kernel.org>


