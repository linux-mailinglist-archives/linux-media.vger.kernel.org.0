Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7636710B4
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 03:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjARCGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 21:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjARCGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:36 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002D7521DA
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 18:06:31 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v6so47645560edd.6
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPh85HDV7Jw4nWVOxnyUOQB6ME/srGkxE0cyhhHU/Yk=;
        b=QVIZgJlLk1umjAWsyCPwP7XPYhLhTT9losqSf5WkDA1WJ/TBaeqSo0vYTrysPHJnb8
         7pyZN8RlI8lYKRpA/1yX/+Ei5U5wxeM/LU1S26Sk/Uj5peY++NLxBsJPWcw63oUfvi2z
         8HyQvVXIy+CCd0JHJ3eGEdxrlhXOl4+m6pW9goseei2GipCXfvL2LX+2E4pidNj826yM
         j97TB9XMMs7qLQcdM9oMiayj6m97CCinuCcByh4SZ6OmwdMhXa5LXbaDNZhBpPxr/6Ie
         RxN/bWm2C4DthmWxU6ifh/wgVGtMjKXkbr43NBruyh8jisWbezeSvtjBu+jDni/fDXYC
         SxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPh85HDV7Jw4nWVOxnyUOQB6ME/srGkxE0cyhhHU/Yk=;
        b=ht361/Tb0pc7NuwI2bBNG3bvuwKrKRW77lClifrev2EYsIOlifwGeR6UTiqufs35fB
         6UQNCF4JHYgo9nc2BuvC5s/hyHjAIYBpBf5jzJPGkJLv0X70T+9XBWldxgiAnX1P/6U2
         SEci9stJ1kkcWQoK0xvVMiG5yzNBoRsRpb8mupmPlu+lNw0rtLaMsfZjSB7Bwty5N/p2
         QOA63vcjVaT2T/L5FFdvIlHzH9NPtvruhJjO8++33Y0Co2+L9FIR5MuyBTTQG/Kwz7It
         nnWA6+gFy3wxoumArlhr87/p/bZpEyZ0Wf8KS4K+BWk/hff0mVzP/qXnMfOG2BJ5wMBf
         JkPw==
X-Gm-Message-State: AFqh2kodmj+1xWvRNmMpJuY1evZeoMTlNs12pF3nNujicJ4ToohRJJOS
        XBk8BNus1ud6ac6fz+Xl1wy0Ng==
X-Google-Smtp-Source: AMrXdXtMG/C8Z6HucSOog75whRYOxAnKIALrlKkOKMedyIiyZJTMJBZKlKtfCmnPPSpnF4D8Wc/TOg==
X-Received: by 2002:a05:6402:298e:b0:496:6a20:6b61 with SMTP id eq14-20020a056402298e00b004966a206b61mr5469620edb.22.1674007591554;
        Tue, 17 Jan 2023 18:06:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm: Add missing check and destroy for alloc_ordered_workqueue
Date:   Wed, 18 Jan 2023 04:06:13 +0200
Message-Id: <167400670545.1683873.7363279471120139264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
References: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
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


On Mon, 09 Jan 2023 10:20:38 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
> 
> 

Applied, thanks!

[1/1] drm/msm: Add missing check and destroy for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/643b7d0869cc

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
