Return-Path: <linux-media+bounces-57811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JNeJAAkzGllQQYAu9opvQ
	(envelope-from <linux-media+bounces-57811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:44:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436C370BB0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B0813045C2A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB7B3EE1DD;
	Tue, 31 Mar 2026 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT6n6T6c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B293DEAEB
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986236; cv=none; b=RYdmY/tSffS6qq1vEeWA/pt1BlvsF19YiXaGONVCeRCLiEdeDmTZrFUdZebiI68RMIJcSt9bhV4YBkjcGRN23F5gfFq727IoolecWMK99mKtXx6FBkjzqaZrzPxbMMHXgwbOAgg8in1Ky8EG2jmR+3CPiUJ+aW6bqhbwu3scO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986236; c=relaxed/simple;
	bh=kJtaTp0b2xxkENPXxh32EK3QZ9vMlk40N4Wgu0tyQ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKAvD+HycUSa5Gq1j6Dd57p88iNvh7XFKO59+FdV+60hKGCo8tgEBjTn6RslzD+xEYGYDzrArIaTR2XgNp4jpxssIQjjlELvoaYDP6K7JyeCqBbS9oqpeTM7mDLPbDdIYQh3EdzrIjaabqGVvLLc5wxJGtllvsg/AdXO2ZvVKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT6n6T6c; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a08fa355a1so38381956d6.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986233; x=1775591033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=pT6n6T6c8Z+rCjInX2b9vWMzjPLKOEMv+XN7K7tGahLbZ/QSkVRCEdXdwpOapUXPyg
         8FSE+OAX9nWrQOhGQUnCsxJgfzXjMAYJYhh0TocjitjQFEdCkZy2gqQ9l9SLcnvh+yKX
         ADfMdBZ/D5iC/bipJ9ojBBlIaAGDob0kMcj4JvpseB4iSgdNofWe9YhnnGKgOWXRYkZv
         kSQ52KXIbIZBYeCvvjUKorlUgLL2dmDqnnWwyxU8ZelsxxXvQwljnHwHHxV9drcCIxU5
         CosZkqwprGqiARFjlLEEjZYUUlzwMYPpgn4XRx4Qht8XJF80GNo4TjQ8DIR75MSy+Geo
         kKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986233; x=1775591033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=bVHInvw7EusLji0ZpgrjwGLymk6oW5mb2mHRdVGAy1Qde/bDJEGnRH5cQtDHe3pqWq
         bYMU+MWa3tJBOgOON40kVceuYzIBJZ6/z/7YdAVBMY4Mrkl1mSPDEjcc+orOZyE1BsOJ
         FhWsEjJ12cXVNuEquGNnI8jCUvTNKXGrsFNLLi+CoPT5SaBaNxCcs8v1rtSTa74U7wSK
         O177zPODZhRoavKEBIqRhnzrA8YzHJYwpaWHw6F9/GEA5EQAho6Bz7gQcpLerZ13qGuh
         a05wPXPvJrUuLjk3gVRZmkirPul7x5PERUlxomE3YkUFYeesFPR2X6vwTpZO7/YNv9jd
         I1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM5wGgT50AnH7A62/2ObB7joJ8ZKXaxlkecAPBiCdFERcKlKd9ROXanavWIexJBqFapNpKHnpVowYMgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXkIG02rOYShlivSecnLQ9+drbr0s9Sq3QRyPm7WW9QcQQtvrf
	Qff2g7F9gmT3bSWVXbzft4qrxpm8F1q0JUOuLLuV+Nq3642O4V9Yfz7H
X-Gm-Gg: ATEYQzy/maoTCva1kJFOJ1WU6YFIupz8EC7CE0CcdUVV+iXLJP+Nw2J5AFZ77ltGPxb
	RH1TmmxPiYMfofRR/lTaCpePxbfzdKotRLvY0Rvq5ES0Q0Dt8kUL6xwP395DmU/rwfQkW3IkNMG
	7JwVBMtaSUGDUoWpoBpTadxRSk4J0efAkiTbaPI74COMDVjnhYCtywTRLziBZ+x80g3NqMHM6/o
	Eu/7n196Axmbzo+jWwY7y9D9pDAhxKV2FN21oaXqb2pM8Zi5L2E3nbQZ2n6CalUxjkb1frVa5fp
	+MpmtBxDBwzLkLaWmT+FyXy6Zkla3pQ1N6aJo/ZCxXMhdvkZRuqvVJWPyL5VZ3yQdgtrhVzKIcW
	fzH213AsHORo4foYUfowGfSjCBFl0stEQnXQungF9PlvL1pPuTlfcYTHnmVpCkAc+nG0FPvxZbV
	dVMA+inU/BPjZczntyZn0u4pbUl9IkpzrISQ8=
X-Received: by 2002:a05:6214:2c06:b0:89c:6ab0:3744 with SMTP id 6a1803df08f44-8a439d8dff7mr13268696d6.47.1774986233262;
        Tue, 31 Mar 2026 12:43:53 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed003a918sm101099246d6.44.2026.03.31.12.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:52 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Tue, 31 Mar 2026 15:44:34 -0400
Message-ID: <20260331194437.41041-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57811-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0436C370BB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
- mention 24 MHz in mclk2 comment (3/3)
- drop applied patches (previously 1-4/7)

Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
- add data-lanes to dts (everyone's review retained) (7/7)

Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes (4/7)

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (3):
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 +++++---
 2 files changed, 131 insertions(+), 15 deletions(-)

-- 
2.53.0


