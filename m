Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1455D6710A0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 03:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjARCGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 21:06:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjARCGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:36 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA17A521CF
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 18:06:31 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id s3so9545426edd.4
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCpYgRmq69b6/9nwI4nlNw5U/U3mYH9SS4rlE1EJHiU=;
        b=sCdC/8rkCqqt/a18OV8/ciuvAtSFzsn5rvwQ6JF7c2X2ONJTikbbOfMQ3qz3SR/tGJ
         dHylXVs1VB2tIor+Y9J8cNOJkg+LIZcwrTD6LXHlH/QI/56TWMFVEzybo3ekpqaIqK2D
         SEoS8IuNBb7QiFEdDQkTJDfcgNsOP908WjbebshzbxMw29Lw+KlU+mZWR8ZaIZu8KJnS
         tB1e/y+YwKojIBFItFhp43Ef7TZnFD1ePImEabJpkbLUIMZt8M/mhXfm3fHOgZx5/J6V
         aabqwtPbWpJjZZwy+5ZDThK8+K6Aj5EEe6kWBhkgRvZoSVC2jWlXA58n4f/oQzdysSut
         Ztfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCpYgRmq69b6/9nwI4nlNw5U/U3mYH9SS4rlE1EJHiU=;
        b=qW2Sn3U+ZqDmuyVA3T9gCUPeE+k9fvwtL5UqvVLBUAqFSGgOEl4UKbRYdAdf2sGU5s
         fmFhocZaN8kCUJd01FqcN3gfcnDOcuChonhhLoxRw3J0NffVD4tgKKhm53gMipM+tGom
         6gKjtc0CBVAy0zWw2+QyP8ujzKaB6mVqfRsBGEGt21EzF4ZXVg+qSlu4KW7XBGFcB2M/
         IvWdaOK5gTATq5qUCy7U75ifE12r/v7CdEJfzha+RNITVD6hBAP/lfSOVrjknc7RG8Eg
         dMdtaEJ4y00iYcn1UpChKCbDeCHSivDDMbv2OLZ6tU9+fu+skF2YFMLeiW+OITiqg6zD
         XR1A==
X-Gm-Message-State: AFqh2kpKCDlVgb26V2+duVafC5kpZyFXuO31dLhrIrKYLeuZplEWDoTi
        IL8uyQwcg966Z/+HGSBq6xbqfw==
X-Google-Smtp-Source: AMrXdXtm6bVjzMJezwlqrDTZWdefkIkOq3Ckp9lzvxb0zQi9T11yRyysye65sUbvVZdrI/LV7YbkaQ==
X-Received: by 2002:a05:6402:501a:b0:47e:bdb8:9133 with SMTP id p26-20020a056402501a00b0047ebdb89133mr6465531eda.38.1674007590289;
        Tue, 17 Jan 2023 18:06:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
        christian.koenig@amd.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/msm/gem: Add check for kmalloc
Date:   Wed, 18 Jan 2023 04:06:12 +0200
Message-Id: <167400670547.1683873.1210769890022767222.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
References: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Mon, 12 Dec 2022 17:11:17 +0800, Jiasheng Jiang wrote:
> Add the check for the return value of kmalloc in order to avoid
> NULL pointer dereference in copy_from_user.
> 
> 

Applied, thanks!

[1/1] drm/msm/gem: Add check for kmalloc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d839f0811a31

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
