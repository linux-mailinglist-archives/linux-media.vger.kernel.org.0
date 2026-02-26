Return-Path: <linux-media+bounces-53515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJKSIq1ZoGlPigQAu9opvQ
	(envelope-from <linux-media+bounces-53515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:33:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374D1A79A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D693530A04D3
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3433D34A8;
	Thu, 26 Feb 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmnWL0cz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26B38B7D6
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116127; cv=none; b=FtyHgU4GaovXaVvK/kwrvcA5TSOuYb4H5mF9IEH5Ez4+LKi08TP13iDPar+b50vHDwpI9wg3vb/iV9xrrAr95jyLcchD9kknD0MayeKezKZwyteiAytBF72ryyVXRiYVOTO0g8YB7NrG9S0k3vcPgRaKWub/b3BTiCJgaZ9vPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116127; c=relaxed/simple;
	bh=wm7hKhRIOsTJvHYLLsapcc3P9qV0qsjGs6Sw6VqBWq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N2zy5V5zPxm7Ua0ajruWnL/Ba6rYJJf50HFiBVXpFFoHmWYPmOeyLLgzaJSLNRSXAxyfTZJLbyUOzlz76mZD1z8nB3Mz8sONqeMJr+JYPlIU8ssenleBa3+tm56Cz+tDxPdywO851MDJjmjn9ROHoxwktjaWL4RdHZ6Ec/ShT6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmnWL0cz; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43987b97701so634551f8f.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116123; x=1772720923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzj0lOVkiiU7GKn1t+4UOovIxHF46AXGBk6ksc1uFUM=;
        b=OmnWL0cz5bWr0fyeP07NySHbDqm2ZPMhqjSfunSk1VX0Nhv06zDYHuRb6U8cA1HHfJ
         HWkq4cvbQHM6tlmUueiJaThhfsKt+iJHfcjC69GxOnpqlrNfI8xCvEd9hFpM0GYSW7yC
         5zoXGCrDAtHWA6vxKM+DVqGK4dtMbY9pLprOk8kOU7uBKroVcqmRBOqTHt0Jicomom7J
         zayOzdZaYVeGRiW/RaJKh2QZi0htIcnBiMRKLVkv1k8eLt8oNyeLgsclceDPR546C89j
         9YtNUSdHpkuEGkjAXzh2tH7jsDLhOqqBizZm7YxxmlBvSpdyBT1I6upc+6y+JFC13tio
         Oa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116123; x=1772720923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzj0lOVkiiU7GKn1t+4UOovIxHF46AXGBk6ksc1uFUM=;
        b=l5R+pMigBrj/aAVusnNbplHlOylapKA4AOEfPOeV1zIxVSLqiR7LXU4G/p9fLmV1l4
         bCEX5oxqRvV6Qq5S6EX3UC++f/MCkjxqTjFiU5euyyCTtfJBW5A1mUvnjj8GuEEEaMsH
         HRFxanXVvqDd+5B+TV9dNishm0vQGnE091RRCFoE7iCywTXdrrJmm23AUxwy+ys6THaM
         sU9uOq/oJ7YjR70IRkBIj53xVQCL7r7tq5J0T+BAO+kOAbc0F6BMvqTQIBlBSWNfM/GF
         gCPWvWkpoGQDaThCunaG7vh0dYp7sLxyMrDQlntmt9c2pKbZyuY7/iijhK49BWBET6Qz
         vbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+9dd6StU4LiDo4sJ8JGM+nnq26+KTDulcskf6/fow5HDq7gYnM5yVG2AGE0cbOWUjprbM4YRJpaxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeZqiahMFvWL7P8D2uyMy9+b1txxaoIexKGwfX0uSB/rD4HtK
	TT80NFZdBHh1YweOe0+jKFSYSt6dl/VxCfXCxhPiMxfGnEa5L6we9ZoFU0c7MXzVMhA=
X-Gm-Gg: ATEYQzw7Z4Psfhx08UnLbUnpkFYglVaGw2f5nk2e/0Gb+zwny7VVA/DfuYpmH0VTeNh
	EckPTqQFblPtedsVAWg7FThV9Mj/YqmM/nKDJQHh+pjEKw/zUaxKatOD8gcbABPUxZ1jmSa90z0
	LmjFhYF/pejiZUF4YosVEBPKSGTVfFp0R2GUUy8LVt3heaK9hnw5h+WIK83dmGjRBqM7D2yr3cI
	crgpP49HIKAykuirdB8JYOvD+bGbBYoOjcFLk0zFl3fpxzS+TnO0XVCUWNcKWpkzCzZp2ZPO7fG
	kNQbfycNhqbSmIl5OgIpklWns3Vhbd9hri+bbEwjcu6aXeb5NnhzHfoAz0m9BoCQZChP3iqdZPf
	seqmtqD10m72CUfflHzUnnkt1G2NcRQajjCmMAO1sPzolNIqyW7KjlV+bKNiDkQAXfjZGE7QkKT
	850qAJ4wGcQePDwghUBPyALOtD9euH2EJARzJqP0U+dz51YYUxeHuNrsquB4YpANbj
X-Received: by 2002:a05:6000:1884:b0:435:9e81:105a with SMTP id ffacd0b85a97d-439942acf7cmr7966311f8f.20.1772116123015;
        Thu, 26 Feb 2026 06:28:43 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:42 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v9 0/7] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Thu, 26 Feb 2026 14:28:41 +0000
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlYoGkC/53Oy07DMBAF0F+pvGaQPX6z4j8QC7/SWoKkskMUV
 OXfmVZCgLoKyzujOXcurJdWS2dPhwtrZam9TiMF/3Bg6RTGY4GaKTPkqLkUEqKCtzp+rDCWdQb
 UwCXQOM+9wiqK44JzSOG9dxCam8GqGLMMjMBzK0Ndb2Uvr5RPtc9T+7x1L/o6/VfNQktwyiQfj
 PIyuGe6DG16nNqRXXsW89tWu2xDdskpYhqSFIh3tv2xrRC7bEs2j0nn4HDQaO5s920bjkTtsR3
 ZXmthpZeR3v9jb9v2BWmm33L5AQAA
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9543;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wm7hKhRIOsTJvHYLLsapcc3P9qV0qsjGs6Sw6VqBWq0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFibkNZphzTpScJPU6Y2cvSot8LF+frkhyZm7
 3hRr9hQHX+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYmwAKCRAicTuzoY3I
 OgQzEACX5TDTSjqgaiKgc8DlvDoi35i5bWoHxvpyBqfyU+M1y57tlYmLLlv3gugMkadvkktH6ri
 va3z98UhIKZ/YBNyWkXhebmnAhg5cWi/J81Iz9sTRwggqpVc8ZoMXjNVSlQkafte53lh8yHlCno
 ClSL/x0Yw0sDEtTNHzLGI8BpK22/RbjkEIWTEBu8mVSItJzPUcGVU6BexXF4nRRGvuVhOb9guP4
 Qc5FybFoJ9pCipK0Hn4Uy5g6eDZbofGQ+nRYne9a3D9JJhUc2Qu5E+qtwFvPt5SLWRApIFdTlB+
 nFKnj5HrFTKs2SQBKCXaInnipWasyTXcq964LdSM/rDiT4RMx3GKJUw7TmE/4sNqRAhRCUJDS2K
 dbI8JSOxWVzreqvcX579HFLu78XK4DDokjD5IN/f3W3uXQE6DW3uvZMg1JBWS2hxPvZTEEsY3yi
 bUl47MzIWv7sS7GSLj1A4n4Og0/v3xOO9tjbAuDj0oQIu6JK6p/p32RdbxV8yIh3rsiwyhrIIjk
 cyX6vijvvuasY3uU+vfhyVLG9nCtt9wEx4LZfnrp8JtPRIi/rggoTurTiqUjkZ0ZSOVmJYugOCQ
 d4xq/8eEBndZt2VyMsGPXZtNz+uJNzPomYJwOVqrZfNPGF71RLDxeOJ5YLsiG8qsQGNEdrqGxrp
 kDlR2iEs5QwS6Dw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53515-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,some_other_address:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codelinaro.org:url,gitlab.com:url,someaddr:email]
X-Rspamd-Queue-Id: 0374D1A79A2
X-Rspamd-Action: no action

v9:
- Adds phy handles as optional nodes
- Adds minItems: 5 for iommu entries
  I believe this should be acceptable as maxItems: 8 continues
  to be valid
- Makes CAMSS-level rails optional for x1e
  Similarly I think this should be OK as the legacy binding
  is still valid it is simply optional instead of mandatory now
- Supports CSIPHY nodes adjacent to CAMSS while leaving
  csiphy regs intact.
- Pushes dtsi drop to another series everything in this series
  can go through linux-media
- Depends-on: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org
- Link to v8: https://lore.kernel.org/r/20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org

v8:

- This version rebases on latest media-committers/next - bod
- Adds support for "combo-mode" PHYs in the YAML.
  It will be possible to build out the code to support this later - Vlad
- Maintains the upstream model of connecting sensors to CSI decoders.
  Every other upstream implementation does it this way so
  CAMSS will do it this way too.
- Reduces the number of IOMMU entires in CAMSS to those required for
  CSID, VFE/RDI/PIX respectively.
  Including all of the IOMMUs implies we will also "stuff" CAMSS
  with ever increasing lists of registers but a better approach
  is to have individual nodes for functional blocks.
  For example this series supports CSIPHy as a separate block
  CCI is already a separate block - and we will add ICP, BPS, IPE
  etc as additional standalone nodes.
  camss@someaddr {
        //existing bindings vfe, csid, csiphy go here
        iommus = <just what's needed for this>;
  };
  bps@some_other_address {
        iommus = <bps specific iommus>;
  }
  In particular this model will save us from going down the same
  path as the vpu which has ended up tripping over the total size
  an iommu entry may span.

  Nobody really likes the legacy binding much so instead of
  continuing to bludgeon more entries into it, I've conciously
  not included BPS, IPE, ICP etc.

Depends-on: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org
Link to v7: https://lore.kernel.org/r/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
Working tree: https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/qcom-laptops-v6.19-rc8-camss?ref_type=heads

v7:

- Reimagine the PHYs as individual nodes.
  A v1 of the schmea and driver for the CSI PHY has been published with
  some review feedback from Rob Herring and Konrad Dybcio

  https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

  Both the clock name changes from Rob and OPP changes suggested by Konrad
  are _not_ yet present in this submission however stipulating to those
  changes, I think publishing this v7 of the CAMSS/DT changes is warranted.

  Its important to publish a whole view of changes for reviewers without
  necessarily munging everything together in one sprawling series.

  TL;DR I moved the PHY driver to its own series review comments there
  are not reflected here yet but "shouldn't" have a big impact here.

- Having separate nodes in the DT for the PHYS allows for switching on PHYs
  as we do for just about every other PHYs.
  &csiphyX {
      status = "okay";
  };

  We just list phys = <> in the core dtsi and enable the PHYs we want in
  the platform dts.

- The level of code change in CAMSS itself turns out to be quite small.
  Adding the PHY structure to the CSIPHY device
  Differentiating the existing camss.c -> camss-csiphy.c init functions
  A few new function pointers to facilitate parallel support of legacy
  and new PHY interfaces.

- A key goal of this updated series is both to introduce a new PHY method
  to CAMSS but to do it _only_ for a new SoC while taking care to ensure
  that legacy CAMSS-PHY and legacy DT ABI continues to work.

  This is a key point coming from the DT people which I've slowly imbibed
  and hopefully succeeded in implementing.

- In addition to the CRD both T14s and Slim7x are supported.
  I have the Inspirion14 working and the XPS but since we haven't landed
  the Inspirion upstream yet, I've chosen to hold off on the XPS too.

- There is another proposal on the list to make PHY devices as sub-devices

  I believe having those separate like most of our other PHYs
  is the more appropriate way to go.

  Similarly there is less code change to the CAMSS driver with this change.

  Finally I believe we should contine to have endpoints go from the sensor
  to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
  not the PHY.

- Working tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.16-rcX-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-phy-v3
- Link to v6: https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org

v6:
- Removes 'A phandle to an OPP node describing' per Krzysztof's comment
  on patch #1
- Drops Fixes: from patch #1 - Krzysztof
- The ordering of opp description MXC and MMXC is kept as it matches the
  power-domain ordering - Krzysztof/bod
- Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (7):
      dt-bindings: media: qcom,x1e80100-camss: Add optional PHY handle definitions
      dt-bindings: media: qcom,x1e80100-camss: Add support for combo-mode endpoints
      dt-bindings: media: qcom,x1e80100-camss: Add iommus minItems: 5
      dt-bindings: media: qcom,x1e80100-camss: Allow CSIPHY supplies to be optional
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e

 .../bindings/media/qcom,x1e80100-camss.yaml        |  90 +++++++++-
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 185 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          | 124 ++++++++------
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 333 insertions(+), 75 deletions(-)
---
base-commit: f69743819496c1b9ff12960dfd67e7093b4f5ee9
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


