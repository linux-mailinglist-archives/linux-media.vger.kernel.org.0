Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFAC2110F4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732479AbgGAQpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 12:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732429AbgGAQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 12:45:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176E7C08C5DC
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 09:45:44 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b16so11219999pfi.13
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=49Mcn16N+aFa9aOh6hAClWXAHESH62HxDmnKGrH5isY=;
        b=lOkSuCqdZxAVVWrp8Z9RY9n/dWoxakBrY7g9uGO8za+REDWilZ+06gQnXUNC90MPLH
         O3ZpsV5pt2i9f74lUEAXsK5Qp81t9qWAGVTmNVuKGkUGs3Ypd31bVRnOXBGsV1gKoDPL
         mn6P+Kv4rhd++DjtknIB17jBrmyBdM8iagTqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=49Mcn16N+aFa9aOh6hAClWXAHESH62HxDmnKGrH5isY=;
        b=lBfQPDmmyLxiAtX0uX+bKT7bSzBo6V1yI8w371HTMQ7lG9mp4iZ/LT94YvIuhRvGg6
         OGUQUz4YFQVajypNMODwrBCBL5zW5UiBhukkYQDfqtdT89+X6ZkIJEo/JInEQkywuMjL
         ym63bAT6F+PyHKkJ5mJXzA6Jq1IAbEPq8xns0yGREGna/53hs/z+n7DZZYCGF6IADl04
         /+i8VgXn6rBSlzXcznSNFZwEcDEwrIyfvzzTafZNfwg2DDRyOHHms4KNsNXrvrq+fkvl
         nDDm/Z3cNYZTVFRtFUC0ZNZIZDMzPMdxScNsAb5sZhRtdaqky4U2aygUXKuM8jexNk3b
         IJzg==
X-Gm-Message-State: AOAM532az+wJLjDJ/M8USKlR2aQKc4DgSL5wqXXvq9tmUqq6Yv4vJK4T
        EgWYPlzXLaNLJ/u8Gtr3j/NeHg==
X-Google-Smtp-Source: ABdhPJzti+3JRqlNwHbknWrNbd7E/zM7wzW61RGwqj6TcBm/r/My/0CTb4cEkqFl07Qz2HEhcVBJ1Q==
X-Received: by 2002:a62:f206:: with SMTP id m6mr11815418pfh.260.1593621943597;
        Wed, 01 Jul 2020 09:45:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c3sm4464005pfo.203.2020.07.01.09.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 09:45:43 -0700 (PDT)
Date:   Wed, 1 Jul 2020 09:45:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: sdm845: Add OPP tables and power-domains
 for venus
Message-ID: <20200701164541.GA3191083@google.com>
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593603638-19296-3-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 01, 2020 at 05:10:37PM +0530, Rajendra Nayak wrote:
> Add the OPP tables in order to be able to vote on the performance state of
> a power-domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
