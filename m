Return-Path: <linux-media+bounces-20570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D09B5F4C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B491C21047
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD01E231A;
	Wed, 30 Oct 2024 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryfARw5Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C46C1D12E5
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282056; cv=none; b=tceurHjnDgoZryRxX2Oqq4CTyfk1elOoraZ+S7L/tcTMajAI6r2VUEjfwRfHK1eGs+NIdrmZkJvTnn66r2bl1xOQzS0KgKCwYyLzHZXTMK3sBRyNgFCmyOQvHqWXQdwfCL0H6dHr0yw4pmWkjJsxFBnlfQbaboH27dCFVAzh3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282056; c=relaxed/simple;
	bh=ihVKMa9fIiPjVTRwISmeUb3fTPbW3FN0WJiDZyuvgdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GS93RSKBUR2rAr5J+n7E/LcQs62tQtKvY6FVIdVOBBy4Kdt9I8mfDKWk5lRxf3c8VZdLvTAgL/sPsOZDO2T7rD33yO3XYBm+ztipfPC3bKL9iwNYUGao8nTjeMPs6GqlJcaSC+laz7148TOG89bDKq78UiZusH9LzqDj+J365Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryfARw5Q; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fc968b3545so63722621fa.2
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282052; x=1730886852; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZStvDwhCq2XWybrZ45pekkODPy7rMRybpcC3DukUuD0=;
        b=ryfARw5QaAbRshhzYg78TUWsu01IfqSoKUzyPVKdEi50fWX2P0MY+xHJrfFcTrOIz5
         Hl079NM7AZsUW1C4PemEERoA5oaUICequZLFhGZhtuqAW2sBxcXzmw25fAWPDuVikg7C
         aJTjCbBh7IIbU0uzij66O43BPfj7tGKojT9EA3lkJ1xuvJbJyTFpbZJ3lV7wGU5cddMV
         YFQwEbhlEYc4KAyuCYv/Px6SPStKhvUJ4j25JoN1uVS2smD7KDW4ElPgDNo4+tmUSuAm
         s2s7RGLbpWFNHW3e9E5FZ42PdW0vd61q4TrhxHfdw/hdXqjXTt4YuC8FMK9lSrCrul0q
         qeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282052; x=1730886852;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZStvDwhCq2XWybrZ45pekkODPy7rMRybpcC3DukUuD0=;
        b=MrZvrSMfhRrDDEH0X0rDTB0hH6VVjwKQk49TXcafzPABUZeacIzCthOLwREcTuxFxc
         QAl/+UMoywDn+KqHKZ+MCh4rKiX47SKCr1LnRdD0sWYbHU8an6sEIwKy0FtMtkLb31jW
         Es1mhENPGxT+u9ZnVB5b72bnrIxBSXNo44L4i7/NPNbjb9XYNz8DOf7VAGSKjSqwwSvv
         HkCA1soZhOO9XhzXWwccE+xxShg3J24eNAbl7JQAiGrYhFoowmTOPjeuBawPe6T6/4SB
         820+IteSYrZPf/JmD0WIpHqAptzZHvn9M3B4oE762QwOixzEMNNBurX4g2pFjEce1LiW
         7jhg==
X-Gm-Message-State: AOJu0YwhsMMFzTg/5fZU6tiE5UnW6nbDWOxv1K9Up0JegzPHxIk91f/c
	SD4rF7kBID4Q8GPCnGI4s4giQnomMdafHReYwCVJJ8PZm0PQzWPbJ2FSHc9Cu6o=
X-Google-Smtp-Source: AGHT+IH3Ke+Azp/lJ+d2pwzB+LmZyvwZIOxx0jX5lenp/2EntjGSgSfSe3Cq63QBM4ZLhKX+s97lDA==
X-Received: by 2002:a2e:4c12:0:b0:2fb:5014:8eb9 with SMTP id 38308e7fff4ca-2fcbdf9af96mr58487671fa.10.1730282052345;
        Wed, 30 Oct 2024 02:54:12 -0700 (PDT)
Received: from localhost ([41.210.143.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712bfsm14901569f8f.79.2024.10.30.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:54:12 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:54:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: rzg2l-cru: Retrieve virtual channel information
Message-ID: <3ccbb1fe-6888-411d-a02e-80a0c25d0e1e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lad Prabhakar,

Commit d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel
information") from Oct 18, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:322 rzg2l_cru_get_virtual_channel()
	error: 'remote_pad' dereferencing possible ERR_PTR()

drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
    315 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
    316 {
    317         struct v4l2_mbus_frame_desc fd = { };
    318         struct media_pad *remote_pad;
    319         int ret;
    320 
    321         remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);

Does media_pad_remote_pad_unique() need error checking?

--> 322         ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
    323         if (ret < 0 && ret != -ENOIOCTLCMD) {
    324                 dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
    325                 return ret;
    326         }
    327         /* If remote subdev does not implement .get_frame_desc default to VC0. */
    328         if (ret == -ENOIOCTLCMD)
    329                 return 0;
    330 
    331         if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
    332                 dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
    333                 return -EINVAL;
    334         }
    335 
    336         if (!fd.num_entries) {
    337                 dev_err(cru->dev, "get_frame_desc returned zero entries\n");
    338                 return -EINVAL;
    339         }
    340 
    341         return fd.entry[0].bus.csi2.vc;
    342 }

regards,
dan carpenter

