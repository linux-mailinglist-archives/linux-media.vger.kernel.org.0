Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8DD276B43
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 09:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgIXHys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 03:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgIXHys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 03:54:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EACC0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 00:54:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jw11so1186911pjb.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2qvkUFyQs4JtT0yP0TnoXkKYmat2qV9C40j5r5Syjtc=;
        b=iD2A8w82fFDUvTtdgdEqYzf0LjHThHKnj35USMwKwohcCho4pwy/VkLZj/oRgD+Psq
         N/wQBhvt3IM5pGZJRu3GMWpTud3OWpVa2H7g9IRxoFHoBfn0AVeyXMSHhbviWbeyC6ej
         V0VpoEIhiM3dyxSebHRx5LAGMxxjC23tRa4dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2qvkUFyQs4JtT0yP0TnoXkKYmat2qV9C40j5r5Syjtc=;
        b=DbSG9I5VWRiAU08Ot+WSXt8pgRoiTJ9+jomml282s8dBXTNM0fi/aKHmL8BWD0BLXJ
         Y6arOOiru/Z19xhXiRJt+OuMHI4MKwMy0xt05haSEhY+WARCi22kWvnmPVqQQBOV+zYl
         zi6YgCG2afTyBrimwFQQnftcQQIpLDT7RjajNEe3AOjUfVQ9r1hv1pQ38flnoEXAZUrb
         5h8wPvtFB3FJh54BcRnB7qWxFi3btlYWprvVkLwgqollf3souLV04lks9qJQQQ9JUV1r
         OtyNlnoNXF2mdI+T9vvhBqZGbm8diOdb36DzVyyLu5p8iWQzqdLfF8M1KnqqpWzcPbaJ
         cOXg==
X-Gm-Message-State: AOAM533fE3UU7ZK2ztJ0ThmFyMqSjXwMYWcOBirrSgBtFfqRNhWp3g4+
        HujInuBOGb9EfD+gQT3SzJMOnA==
X-Google-Smtp-Source: ABdhPJxk7muCI5mNkknsNy87F6QiUeEkmU+zxr6UxLLFoHt9P4SCQNc/nbBPwcrFzjmmjOUtKMIXUQ==
X-Received: by 2002:a17:90a:d704:: with SMTP id y4mr2986425pju.159.1600934088132;
        Thu, 24 Sep 2020 00:54:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u6sm1498662pjy.37.2020.09.24.00.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:54:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600930266-9668-5-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org> <1600930266-9668-5-git-send-email-mansur@codeaurora.org>
Subject: Re: [PATCH v3 4/4] venus: put dummy vote on video-mem path after last session release
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 24 Sep 2020 00:54:46 -0700
Message-ID: <160093408646.310579.8387411752099581843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-23 23:51:06)
> As per current implementation, video driver is unvoting "videom-mem" path
> for last video session during vdec_session_release().
> While video playback when we try to suspend device, we see video clock
> warnings since votes are already removed during vdec_session_release().
>=20
> corrected this by putting dummy vote on "video-mem" after last video
> session release and unvoting it during suspend.
>=20
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
