Return-Path: <linux-media+bounces-3838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF78312E0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 07:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD8FE1C2198A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 06:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17E9447;
	Thu, 18 Jan 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHpgDcFk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CF58F40
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705560853; cv=none; b=p4OLUGHbAg/mTMdzvA7fpMT8VBPPLjE0uwKyO2N+QP6yj0xRkhJeE2h+4+oky2VwtzOBnvqr9+PUq2C1npin2LW2zR649RyzKN4MoMeDmUTP/cMw32XpqqtaYArsRnPGOlXCj5/BULRmTbdtJlG6hWy4qzP+YRIp494jgeXfecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705560853; c=relaxed/simple;
	bh=36I/7EQggVshdAxY46BVIk46vFnTfJcTW47ie3fDHiE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUq6ML60X3RqBsIVx8AMAg8l0xWkbi0M5TkkDWHovlzyza9OHwUtTeVQ8nJ5KYwcAYSLB9hloABIJnyUCGefdlmYjSSpNSJa8FMOzjcml7lBVY8jM7h8QPU/MClbqBNuVu08sdwsSRjR3ufs2iq3mCVgAr3UCEXp1mJJnBIMGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHpgDcFk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso69853015e9.0
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 22:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705560850; x=1706165650; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8uHvKwjp8u+lK1YgwjbfJWtNw8+WimiEV/CQEQuJTQ=;
        b=rHpgDcFkr8A4FofpkYPHlm8qcmsLebEGG65dSylz6I7jk2uUenKVB13RB3ZrQLu5jc
         K7aQmIR5O+wj1J9UcIOUAmTws/RPiCUo4d87mmlgZsbt7ogyZH1qiqMn+1KiKv/AsVfa
         97cbUQcC3F051WfJNO9uyN8NjYEZI/kWc+VchIX3boQw2EL8RqDcRoL8GnT4Ap0To8lu
         VdJeMuo9qmICqm1RXUT1MkNLMPf1TXPLg2hBSpK4QCNwgCtjPdSGIi3Hax4dh3hKsns3
         1rRDlzIrTMNqNmaDtX5vfTr4pDgLfEeINHZ+C6o0F1rvEnXqJbpqMn0y5omJ0+IAw8/e
         Yp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705560850; x=1706165650;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8uHvKwjp8u+lK1YgwjbfJWtNw8+WimiEV/CQEQuJTQ=;
        b=ix1lqpHl9z4wbxYUVTLbKjHNHR+X9EK/wMon3I5KIFcJRLz2DCqOD+Z8b/7GIqas/9
         V4h8VNZvByWca4t+7EXgZVNrgBv/c1ncR5+gWbmWnRABmkfk/0tTLF0xW/svZ7wXAcVL
         kaMWePAR+jfTjvp9yLTm0PXRrNeVyhfcev585sIQ2BLzNckBRtQiGCpHZS3hs9IJIwMD
         I0kfT4fzXcWDUHtXKLVAhcFjgNFpNHZ5sj5qGGMe7qSt0WrOKQ5KeC8tXQ1yJ65x1CRR
         xXW2bRc1eSf0286UtapcMeM6o4ikfxjDyZlrHAJP/NZPphWUOJLTW8r02aBJGF70cFZr
         h5AA==
X-Gm-Message-State: AOJu0YwqEadCBZ7hTp+WVhRLDlbIH9I9uHiGb4YpPtTnH/DZRlTnNYQc
	euSmlvliFe7VIOQsRsiUe3FmtsjRT0VA/4pcO9+KvQ7J2z7iND3tS3C29zjOM2c=
X-Google-Smtp-Source: AGHT+IHvF54Kn/hiBj3kokedSzE2elT+OdpCwoqxFxQIjhor7g9gOsqNQkESDoKYiJ42ItEt42PnIg==
X-Received: by 2002:a05:600c:4513:b0:40e:4119:cb4a with SMTP id t19-20020a05600c451300b0040e4119cb4amr226821wmo.15.1705560850026;
        Wed, 17 Jan 2024 22:54:10 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id q4-20020adfab04000000b00337d603fd01sm59060wrc.66.2024.01.17.22.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:54:09 -0800 (PST)
Date: Thu, 18 Jan 2024 09:54:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: i2c: Add support for alvium camera
Message-ID: <9709fbf7-2769-4b25-ad6a-d59058e9946d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tommaso Merciai,

The patch 0a7af872915e: "media: i2c: Add support for alvium camera"
from Dec 4, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/media/i2c/alvium-csi2.c:420 alvium_get_fw_version()
	error: uninitialized symbol 'spec'.

drivers/media/i2c/alvium-csi2.c
    403 static int alvium_get_fw_version(struct alvium_dev *alvium)
    404 {
    405         struct device *dev = &alvium->i2c_client->dev;
    406         u64 spec, maj, min, pat;
    407         int ret = 0;
    408 
    409         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_SPEC_VERSION_R,
    410                           &spec, &ret);
    411         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MAJOR_VERSION_R,
    412                           &maj, &ret);
    413         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MINOR_VERSION_R,
    414                           &min, &ret);
    415         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_PATCH_VERSION_R,
    416                           &pat, &ret);
    417         if (ret)
    418                 return ret;

Only the last read is checked.  Sometimes people OR the results together.

	ret = 0;
	ret |= alvium_read();
	ret |= alvium_read();
	ret |= alvium_read();
	if (ret)
		return -EIO;

    419 
--> 420         dev_info(dev, "fw version: %llu.%llu.%llu.%llu\n", spec, maj, min, pat);
    421 
    422         return 0;
    423 }

regards,
dan carpenter

