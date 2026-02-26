Return-Path: <linux-media+bounces-53493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFUlKww+oGmrhAQAu9opvQ
	(envelope-from <linux-media+bounces-53493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:35:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DE1A5BFF
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E02D030CBDE8
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1086D36C5B6;
	Thu, 26 Feb 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQxIvLlx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0625369233
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109270; cv=none; b=S/KQyTcVCQqdkXKEZEjJdnAPN8+jX0IDuwyVL+2zhE5a2bUH5ehrvmiAs03QQNCCztHHWSQKLtxBbB3R4CP6n6f7waNPyE+UmTSVG3xLWSjssxNXxXNw4XQpRRAb7w0EJr/QesHxTP6Oecrsu13DnfX7GgifQy/2BjR3wDJbhi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109270; c=relaxed/simple;
	bh=eFyJKu93ZN5z+1WY2obeWDs7vFA/W2zY7bRl4HHmWvQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m2jj+QlTdvyh1NUzSWpS2RSYBfgdjOnrScor00mhN99USU3YWrRfAO4FbNQoHCmy9W+3KKEOEGzvTzkEnNmMv7v5eP/AIHdMK1iWO8S4X0YL2fWTzbHL6Li6eJgEK3MF2VtP+hgWwTInv5541C5x7qK0ydimCAyn3CuMosCrFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQxIvLlx; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-436e8758b91so527105f8f.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772109267; x=1772714067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKKWsGx9kNR4B+rubyIZrtpZPsK5Sn9sUle9mK56qA8=;
        b=gQxIvLlxEyQGpeW1OZr6xDrwujEFGSBLahZPuhTyju4TmlZBjJLMKSElfDk8FVdCc1
         dKvUj+/RBOG+7lYfAB4j58BhiwuwmxPfzMg4W5WJTYrXLz8CtmH8IKqPwsg1Mhp7lEqw
         xXIeb4Z+slq7/maBMmWGqSrOzEjQBSUQ1nll3Ihj917v3FgDyoe87t2wd/jjhqptK0yJ
         r0BZk8R0uict4qlx1kOKz+/RCQ298+Ru+9abIHlhcXzuDKyiqU6pu+xI3+rVvbVg559Y
         49b5uHE2QuNCAilMS1atH32CjDZW/d4hi/nEa2ufkzWxv0zUAsi3lYrUusSNTc7HdtA1
         lFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109267; x=1772714067;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKKWsGx9kNR4B+rubyIZrtpZPsK5Sn9sUle9mK56qA8=;
        b=ryFC9WK2myYdLMsqOkBb8XpD7+UzEnE1pStJWUrsLkdfg4MGFg/2f0p5vNpVa75DaN
         gBaka1AzDOOJMaE4Jl12beO97NaA0HEHabTDigODV1/rrE1mmKTtJBqsaiy+sLtH0dYZ
         yDsXrC49nuk8IX9lHgPfbNwVoTrZ+k9iunJirm3OG7qmsOob5iZr0jginGzK4bwhuRct
         U8G9u+JRetbJNT0d1xZJ1VPE/TjknBApYbG1gXN91aEXazSZO3gPMvNuzGYyhbq5IhVD
         G35389XRcSOlb8lp0kDr1a+dgH7N2GoK4g47VQRbvuh2pF/3RXxwIorTUxOdlNCnNkt2
         aacw==
X-Forwarded-Encrypted: i=1; AJvYcCWklWSPpc9Lp8so8Xxk+W4YRLyoSsR4ez86Yvj+nh55Ox4TmKNNeUf3hJT84RyVgodcdUUYBmPVqu5o1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmYizjkiSooOK+NF8F0lxtv5Si9Kt5WpB4mrTKflsWVBltTwo
	2qb0VfNgpS8no959fzXDp+2BUmxa2o1CBSQzgqbAp2jq2TzsfdtJtVMXYa86KJKA5Qk=
X-Gm-Gg: ATEYQzxpISI0QZoP177xPOZqYQgNcLac63eXuDkxBd4JCT10qAIig9fIzFEDIHRAYfi
	ZUJ7dfhPuHOGwTpm0c1JmATVLYxyJ77Om8E4WsKHthCwevmVbszpub+LdXpeQjnr7ZtvhZg+dAs
	w/UYLGcS20UYk92tZRufEfwTYcxuGGDEYDeZDKNxBtvchXOeQVFPczi7tVZBKJKkOdWWz1wrSJW
	jzJQLnU4C6qu1dzvKiWeV4vvo/OK6NFvz2lSoMCYQosj9pjJuvTJi1sz8s2Oo9y8/TkAOHXHLNY
	Zuz8L7hoqSbOmcPJoKh+IorbV5OBBa4tYmkddCo7FG3KdF9Ulp5J9XAeOICnt22TklXvhDSF1iH
	hcxty2QKtuOkIWzLrhhQ7ATv4ij5pKP1T4v5X4eFREcmkBnqOOui/vuL4PrFVGbFQxl8CNK+Xxp
	ZxgQ+k/zfMhjg66fdkv5nNLdkf3o1tlgjyfCONidJ9hJKWpIBEZdj/rZTPprjuounM
X-Received: by 2002:a05:6000:26c5:b0:439:8e3b:d064 with SMTP id ffacd0b85a97d-43994302ce2mr7821460f8f.49.1772109267174;
        Thu, 26 Feb 2026 04:34:27 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm40800663f8f.21.2026.02.26.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:34:26 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Thu, 26 Feb 2026 12:34:24 +0000
Message-Id: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANA9oGkC/3XMQQrDIBCF4asE17XoJCrtqvcoXWgySQZKDFokI
 eTu1UAXLXT5Hnz/xiIGwsiu1cYCJorkpzzqU8Xa0U4DcuryZiBACSMFXyTyNhLweVx5r5u6cVr
 JrrYskzlgT8uRuz/yHim+fFiPepLl/RNKkgtuGts6p5zU4G5PmmzwZx8GVkoJPloLAPWjoWijN
 HZOG7SXL73v+xukWXwD5wAAAA==
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5711;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=eFyJKu93ZN5z+1WY2obeWDs7vFA/W2zY7bRl4HHmWvQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoD3U42kowdUc3RliLMA7G+TariHp6RgUBP+VI
 FUsp7qtjw2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaA91AAKCRAicTuzoY3I
 OoEYEACRBuneInvM4l10Z0aHmmRs78QHpno5BGqaKDITKEz8A4a7CaCYqOY93fcbedioaQz/6GL
 wMJm6BjAV1TROpMMv6fF6OjfovXoD3agaWLw1Tg1vFPSRM1mrmd9VV/Zwrjz/CibPmQM7995oHh
 8SDd6rpLosyhxJPHUpnrMV5RduGyTN0fI19luVdNrGRWWqIlQLiEu5uMwNDHRYuv1CrZtmokpAg
 aHEUCw08kmLI82U/zcCSLXiVG9extOR/e6vUOGv5nuidJHaNIy9eCzrHh1VFn3glKrJDjHvzvAM
 4ac7L6nqtq1/az7oUmySbd4BI79hh9CQ5rYUbNBUjdHqfSzW92E1VOG0d41vDU/GapgFCRokvHk
 r3pnmzFOdJe8esHl7dPmW4G43UBKla6gWaHc5kw0Sr61Xz4+hRYuU9Y02uWjj1h/PgphCrwXHgA
 GutJUrr/ZyN3zyPlvP4Fi37PrqbQFY2okjY2TVtAvyJ3AebfPdYaEyAadbFgUFkfFFickG+lS41
 EEti7c2xUrx5MrWEojfyRbmwaIs5T1zhmzUUf3jQfT/BQnVt6jeiWGJna4LDOfn8o6CMY9LwlUQ
 +zoTqZ+OiZIGpf8S3rdlFVsOPSRcRLwUAsz+jPFk9UwiXDMsABoCc81bpxbg3ZHARPglM0fZ5Xa
 PPSeK0qosxhSSew==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53493-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,codelinaro.org:url,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 183DE1A5BFF
X-Rspamd-Action: no action

v3:

- Resending this to make clear this submission is additive to x1e/Hamoa
  The existing bindings and code will continue to work 
  Bindings are added only, nothing is subtracted from existing ABI.
- Link to v2: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

v2:

In this updated version

- Added operating-point support
  The csiphy clock sets the OPP prior to setting the rate
  for csiphy and csiphy_timer - Konrad

- Combo mode
  Combo mode in CAMSS yaml has been added. Right now
  no code has been changed in the PHY driver to support it as
  I don't have hardware to test. In principle though it can
  be supported. - Vladimir

- CSIPHY init sequences
  I left these as their "magic number formats". With my diminished
  status as a non-qcom VPN person - I can no longer see what the bits
  map to. Moreover this is the situation any non-VPN community member
  will be in when submitting CSIPHY sequences derived from downstream.

  I think it is perfectly reasonable to take public CSIPHY init sequences
  as magic numbers. If someone with bit-level access wants to enumerate
  the bits that's fine but, it shouldn't gate in the interim. - Konrad/bod

- Sensor endpoints
  I've stuck to the format used by every other CSIPHY in upstream.
  Sensor endpoints hit the CAMSS/CSID endpoint not a endpoint in the PHY.
  Given the proposed changes to CAMSS though to support "combo mode" I
  think this should achieve the same outcome - multiple sensors on the one
  PHY without introducing endpoints into the PHY that no other CSIPHY in
  upstream currently has.

- Bitmask of enabled lanes
  Work needs to be done in the v4l2 layer to really support this.
  I propose making a separate series dedicated to non-linear bit
  interpretation after merging this so as to contain the scope of the
  series to something more bite (byte haha) sized. - Konrad/bod

- Link to v1: https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

v1:
This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 ++++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 384 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 307 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 102 ++++++
 7 files changed, 936 insertions(+)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


