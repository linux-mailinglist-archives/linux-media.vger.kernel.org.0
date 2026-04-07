Return-Path: <linux-media+bounces-58169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LZMJ1ja1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:20:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97F3ACB1F
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72153092E4A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16EC3A8743;
	Tue,  7 Apr 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IncdlV2q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1005C3A7F59;
	Tue,  7 Apr 2026 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557051; cv=none; b=MUchFFkIkZekbjezQl5kXIGUPi0/2Rn610B5mNRgysG7LLCglx4kfSDWpthasXWBTGwcBGU5nelVDD7BpJCQ6y5cNAtMnnMvDW5B62EutmOZdemym0IeJhA0cvEH7SO+laxHH3TRMZCg8n1GgDNa8azluU9zTXfzEVH+twS6Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557051; c=relaxed/simple;
	bh=obmgK6Kw45HB4rYmBhTX7vt87CPLIBgjEcrdSns1Rdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4CiUccLaTP4BlQtrZsFOrk18ZIbsEitAtTFeg3Jr1MC8At2hUOiDdX78eKcOaXo7m+gn1d1JyXPs94Lue+4nS8HvjEmRl69lxYYulqY++JrNlHF8tq97BJF/ZzFZSNIad2/YfLR+z1jMyutl5Ea4g691Sy0lMcrVsCgVE3UQas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IncdlV2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45013C116C6;
	Tue,  7 Apr 2026 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557050;
	bh=obmgK6Kw45HB4rYmBhTX7vt87CPLIBgjEcrdSns1Rdk=;
	h=From:Subject:Date:To:Cc:From;
	b=IncdlV2qi+gGeVsGfsnKgCAeFm7Ji4DEG470qOcj75hbSbaVie+aQ11ijuhtFrwAv
	 AD0MbHrs5AqkyG/Kt2A1T3O6j2nAfR17Vq5JoZI6vokhvXPRWg+McwYjpEMeFks4Jk
	 7yTuJwC9cBWDczQChJMZS6JKt8tKo6r9xAHBfP2bVJ7DaWKhgZBR+mHqRXPwK7NwDq
	 icaMHU0NR9wKhzMUHg1BOyD+RDlz5kGWlxQI7CGoUKm8ABkTJHdkFtZdptCkif0btE
	 1WAnpb0jJTYxc9XXyGngOF4lvybaFZgWh/UvMMNiPucYgUfn6AaKP4vT38+WGHVTQw
	 e3aqQFSrSirFg==
From: bod@kernel.org
Subject: [PATCH v2 0/5] media: qcom: camss: Fix RDI streaming for various
 CSIDs
Date: Tue, 07 Apr 2026 11:17:21 +0100
Message-Id: <20260407-camss-rdi-fix-v2-0-66f6c600fcff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHZ1GkC/3WNSw6CQBBEr0J6bZthICCuuIdhAdMNtB8wPUg0h
 Ls74Nrlq1S9WsCzCns4Rwsoz+JlHALYQwSur4eOUSgwWGMzk5oMXf3wHpUEW3kjEeVZkRaGnYW
 weSqHePddqh/7V3NlN22SrdGLn0b97IdzvPX+uecYDVLSnprYpnlCpryxDnw/jtpBta7rF0pPP
 ZS9AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4355; i=bod@kernel.org;
 h=from:subject:message-id; bh=obmgK6Kw45HB4rYmBhTX7vt87CPLIBgjEcrdSns1Rdk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Nm0Lf6R0Khu3+mfuaedB5mHyWi72C4pPhijS
 OIe4IgvqUKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTZtAAKCRAicTuzoY3I
 OiXJEACpgRiptKYK6ECYsdLRLekKsEkb0RNVckTKCF95Ztj0vmrXqsMqBSwkEjHMPHwsu0fzbsJ
 LmHav3tT+NU/tMXPa7YrcZmaHZLWsszJ/zKfaNdYTuEev4xYw+H5dxHfZuGAuLSC8vNGksK+kw5
 rhpnUBUNjDBS0r/Yrhh/qisCkoP+eg96heTmQESHXdhVfcZAznGB2aXzlMfFCnxwnzxm3wxPnXo
 EzDaZDfxZbk24LRdNbgbuypD9GF3iV+T8g7//4odJ4jRJ/mJY0OZa5TEDRpTjoylzeaPNW/fScb
 74RnO2GC7Lk3Uk4IaSTG2IOKg4pE0o5qKnicHX7sLifFhOIHOMj7DLvruamXvkb+EAyOxUfLOJi
 032zrhifb9djAc7xsPCueug4U4eN7LIetqx7MS70F0Q30qrOtrE+X9zIHnFvf3v79mE5J4jmcQ+
 KUkBY5ACHxMH+VVeEfToyUjC7y5zZz7fY0WC0GR8SpdPnVURu3RlfnI3j0x+f++mIkmmRso7oxW
 ygaNGuys5GmSUSaEUKq2yKAnVmU+TYsOd3GLDVTR4PJUq6tkQLOZkdgsgorfEoMJo/sMFXXkTx1
 obJPZYcCbKDddzqLOvTW7dw5Sr+x7IQz7yR/i4jQWj8Locd0Kt2p/1178wJ8PB+Xq1z6duIVIod
 9i8ENBbOVwHy3Zg==
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
	TAGGED_FROM(0.00)[bounces-58169-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 1B97F3ACB1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 drivers/media/platform/qcom/camss/camss-csid-340.c | 18 ++++----
 drivers/media/platform/qcom/camss/camss-csid-680.c | 30 ++++++-------
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 51 +++++++++++-----------
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 34 +++++++--------
 drivers/media/platform/qcom/camss/camss-csid.c     | 10 ++---
 drivers/media/platform/qcom/camss/camss-csid.h     |  2 +-
 6 files changed, 74 insertions(+), 71 deletions(-)
---
base-commit: 2211e826bd69c041534093735241182013dde7bc
change-id: 20260406-camss-rdi-fix-ddd769490ec2

Best regards,
-- 
Bryan O'Donoghue <bod@kernel.org>


