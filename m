Return-Path: <linux-media+bounces-15482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB793FE48
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC661B227AE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1354C186E25;
	Mon, 29 Jul 2024 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SBjyqML8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400A374CC
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281553; cv=none; b=D7NToioB0r8H9QmT9VEA/4P4EXTu5ftaE1E+CMw4LEVMVAN++8RYqJhP1eTchkQ/LcTiXfJNQHaTmeRN26b7LU1yXrrZngj+nKvnD9QGuaMc/NvjiAbLB/8GiDpu9Cb676vlYAz9GKkNn/WuyA2fuFW1RRuS5quig9Yyae6XNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281553; c=relaxed/simple;
	bh=ShM8z/td2ThMeF7hERda/q5QX4r937XdpygVltPNzuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fq9d4MlZJqu9srqGBeVsRjmYawG5htJXhEkkus5VAav/CipExzLnTSfdPsqPQ0HvWBeswvjOcNdGZTzEiIqcD3r3hI3zealtf02UTeP3rfYpym5zY06qx+UlY1h5oKCH98GGZIpI7xPS05oaRvJKuxDZMFv6ypY4unWjfoztAu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SBjyqML8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc569440e1so32220645ad.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722281551; x=1722886351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShM8z/td2ThMeF7hERda/q5QX4r937XdpygVltPNzuA=;
        b=SBjyqML8956nsih3Etl3Ek42G1lD1mg2j6A++O+YdosLoYaNfIWeTWjAkjaaBRsKdS
         ZUnI89YnNpbKJuR2FreZGf0A/BWYfq1rNxGxp6atq1UOAWUiGm3ANjh2y9FZuqB/uDVJ
         6mKzbWDmzqBovSA+JJ/jhI7/MB166S3RuaaFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281551; x=1722886351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShM8z/td2ThMeF7hERda/q5QX4r937XdpygVltPNzuA=;
        b=bEaPU9oQwCZrQhrkY8Tzr/RUqs2KIOObP/UYQ6YBgxzT+Zm/zAwEGVPyZY/EBUejSI
         xp27efWWPIDvdehpGmEJ03/YBuOpTet8uPrwLQWBFSIRhFODb0NRPS93u40fJTjxizrp
         T3Oui66LA+LyBFWYdHhrqtOPB7RQXOXKjwditjOxt5cFs7E79undI6xfyekTPgAimCg7
         HVNvXcfpc1+tVXcHAJOcQbpVR7ExKxzw+vyCG8l60S6uUeJnVehoh5ot0JUOQ2EE4caV
         lTGwsKshMLY+KAUdle4xgYQ97+fksT4NjfLjaoUiFU0Ts3WoyCQx7jqbC8yEOgptZJ70
         qDSg==
X-Gm-Message-State: AOJu0YzXnJWU6JG7mHJGv5PD3AgBaau1a3dew1sZUUfpYqV2NGmJjObO
	bbbb6E8Diul13yQSjTmdwiB/sYbu18LmfXBN4UCCf4j2FnqCOVcFFlT1PnnHl5V1NU1cW/RaI6s
	=
X-Google-Smtp-Source: AGHT+IFVUE+lOgBTjWVjpGBaDMIhjjwOq/C1yX/c8+UPOKumtTdGWhk7LO0SEL51W1ivgf35BIJPAQ==
X-Received: by 2002:a17:903:190:b0:1fd:9420:1044 with SMTP id d9443c01a7336-1ff04817e13mr97616275ad.16.1722281551130;
        Mon, 29 Jul 2024 12:32:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:5aa6:a2c1:9047:7da2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7d25fafsm86526265ad.108.2024.07.29.12.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:32:30 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org
Subject: 
Date: Mon, 29 Jul 2024 12:19:09 -0700
Message-ID: <20240729193219.1260463-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


v2:
- cover letter
- testing methodology
- Signed-off-by

V4L2 has support for hierarchical P frames using the
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
specifing P frame references needed for temporal scalability. Encoding a
single stream with a single layer allows for the layer to be dropped and
the stream to be decoded without artifacts.

ChromeOS is planning to use this feature for the L1T2 web standard[1].
This allows video conferencing apps to encode once for a clients with
different performance/bandwidth capabilities.

The ChromeOS test framework ("tast") was used to verify that no
regressions are present. This was done on SC7180 ("trogdor").

Verification of the added controls was done with a bitstream analyser to
make sure that reference frame management is correct.

[1]: https://www.w3.org/TR/webrtc-svc/#L1T2*

