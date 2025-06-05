Return-Path: <linux-media+bounces-34084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41EACE980
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F5FF1759B5
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 05:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A880A1E4928;
	Thu,  5 Jun 2025 05:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmt+4OSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159519CC11
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102936; cv=none; b=eyU8tycb6aZVLnfGtLZDSJevI3YvsXGikKlnbCW+AVMkTT2aA5Amcv4qJAKujqB9TGMM4lgBdi2fZe55SELtQ8ge3qqh8GP8RxJTKjvOYmDBytMinQ1jgM/iS0MCCIhmFCOHxu6Gvs6pb0IrGdsEMJyBl4EJhXsgAFkA2UUsq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102936; c=relaxed/simple;
	bh=zURT2m5bwDZfvgu89Nz3Rxdx5yCUJxd/hPhuH5a1l24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCWk0FveGKIxQEI77OJKm2ieSRkX4tGiNSYm4xA/ThQMA8z4cbty0RPVFecXFU1B4oLz7ToDtu2CZTgvpSQgBpG93keFeXCGdncY2aQpnGhA1dOYzHC5tDotwC9+8KQlVu43SCdm8x9wT/uuTBqE6mSdR7hptTh6YBxedDLliw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmt+4OSX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so1163921a12.1
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749102932; x=1749707732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ol/a69YHn6Z8Z1E3rPR4cd8Ja0wlD86SrLCVfeSdAY=;
        b=zmt+4OSXU6SKkSJ8Oxzk49SwyK5uYctGa1agKM2T1ofOjOzVoaD0Oum0irZI66LHQf
         rulS3ihSGqbQr3a8eBcqF9deuxy+BC6WJ1CZ/q28nFcBnbm4EZZvwBcNN+lvLX1si0kl
         SRjfcjWPw7BXYaO0K9KG+yAiIbOHnhni8Jb6L6Dc+AB9MP5zuFG16WRM2BU69m/ZXQtw
         IwHKJ2du4b7G2zfP559jCJ73Vpe56VCXX1nf/59xh0bSFwXUO8J677IxJeiU6DaOOz3V
         k/hp8BnzWckVr3QCuG4ZQqcLXV0sr/sY1S4VgR1Ir2vrtb6DYcUpOE25/1ZlhY9HGPMO
         5+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102932; x=1749707732;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ol/a69YHn6Z8Z1E3rPR4cd8Ja0wlD86SrLCVfeSdAY=;
        b=topJ8RAwRGJ3ILUHcFdSpEiO4ww9CrBQqIO+oydnu3LQaXTUwMhbw9X/2L0AzlSlcY
         eQIZxnCEDdQoRbw0BZwd9tJltBe7xkPf7WKYOyYMOgDZQVJDlkDvZghSjGc0VwEGErgo
         UTrazbvVHd3sRu0yXwXSlwf4JLgCLY9eV78TXBl2QrSo7ZkG6oEqXamQ1qdsoWawCmCb
         j2sPuDdBFtnx4uPzIg8+i00JZQ9LvPl6U7WUMd39UQ8FjftcuHoCJuHd2q2fw4uEWe3+
         ZgkN5Jm2yCWJd0CFr9bC0j5mmxYENypM1rmxPB2DV2mTUzWG0+frizw7QiHaVwGAUv2f
         0XBQ==
X-Gm-Message-State: AOJu0Yz5wWD8Pa98kfFq0lDn1hrokjNY0Aonrs7MIJtI2J1fMDtmOjbP
	VrbWtZMEDLpWPlm3NHp98m5IReNGPFTymHuiLtkfnzMsayfrVYyuxi28gwODOaRZWxBtgLxNrOC
	oyVNz
X-Gm-Gg: ASbGncslcM4wEiPsj0dtsu1ZRUAlf4MXf0gkBypeMimePmIuAyd6AqYvDVGIobYTGaV
	ClTo71coQZjU8ZVqqz+YQWgR/uDc0jVIQOITGinpGG3YsUDTJIMU3pyWbjisQgpityNDrorle6U
	9nlbZ43PmCAi5PoTHw1oz+jzgCpelkJWizFTnWHNoTG/0k1kk7CmxW7XLBmvxQAlPnVTbu7jdN4
	ZKmCBj5LdjRnp1Ti6jC7PcwbEZZc59OWMtfpML+lJvS/rfSRrvuD4XTTEm8POF6WIS3znRSG+7D
	Pcujns5L2I7pkhlkCG2i2Ba+sRpcGIJznOQb6pn2WB9eYgYcJ3vsStgpxr4DnIGDt+vTDRE4uvA
	V
X-Google-Smtp-Source: AGHT+IG4axg7h15fFW1J2Nh//eAiOSbPO5FNtGxUNYy6LlYttIT/I3Z4H5vRX6rvUFLJJ/hPB4SQiw==
X-Received: by 2002:a05:6402:1ed6:b0:5fb:87a2:5ef9 with SMTP id 4fb4d7f45d1cf-606ea3c5e65mr4977473a12.23.1749102932457;
        Wed, 04 Jun 2025 22:55:32 -0700 (PDT)
Received: from localhost ([41.210.155.222])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6071b7a7fbdsm981668a12.59.2025.06.04.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:55:31 -0700 (PDT)
Date: Thu, 5 Jun 2025 08:55:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] dma-buf: dma-buf: stop mapping sg_tables on attach v2
Message-ID: <aEExTkVMcYEOrIOE@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Christian König,

Commit de68b17d5d07 ("dma-buf: dma-buf: stop mapping sg_tables on
attach v2") from Feb 11, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
	warn: passing positive error code '16' to 'ERR_PTR'

drivers/dma-buf/dma-buf.c
    1113         dma_resv_assert_held(attach->dmabuf->resv);
    1114 
    1115         if (dma_buf_pin_on_map(attach)) {
    1116                 ret = attach->dmabuf->ops->pin(attach);
    1117                 /*
    1118                  * Catch exporters making buffers inaccessible even when
    1119                  * attachments preventing that exist.
    1120                  */
    1121                 WARN_ON_ONCE(ret == EBUSY);
                                             ^^^^^
This was probably intended to be -EBUSY?

    1122                 if (ret)
--> 1123                         return ERR_PTR(ret);
                                                ^^^
Otherwise we will eventually crash.

    1124         }
    1125 
    1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
    1127         if (!sg_table)
    1128                 sg_table = ERR_PTR(-ENOMEM);
    1129         if (IS_ERR(sg_table))
    1130                 goto error_unpin;
    1131 

regards,
dan carpenter

