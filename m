Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A347574C2
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 08:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbjGRG6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 02:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjGRG6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 02:58:53 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D501730
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 23:58:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3143b72c5ffso5316789f8f.3
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=oQzkecp3eDrjKFOrzKgXnZOg5cpVEKRypTPCPmhh/sLLfK0W13xCZzcM/VI70jJFPl
         Fwa3S8NdvFQKkGQYWJAMR1zHFP5Ysl/ufyEJWlJfgVXFX+JVtc8QPkUM7g/l2DRLV0Xd
         rXUYg0ZzVPn/Its3B26G9Rh31SHyyUykKmfeL19t3QK1qBu011h7v3SY91KLqbfBHfPn
         0Vqo0UVhfKmcNde+/yF0AkJzsJTSB75UxChR9fXOS5ItLfBPwN0Ko79me9Esy27HwssM
         Dyobl8S5JWavMrJgqDtPD9FWeR5bs99rsyeUMNa7SakXrucf4MB9NCgQ6ubHIvXoLpjy
         NWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=ZOhAKktr1icf14dDFFJ6GBXCVIwMaHC6eLzbKBwrJOh4DbV8XeMh8uWbErdNtcmKRd
         7RTuDDYy121yxGd9wfkxJlLVsioJjrgiyCSbCb4cGcs8+8T3y2r80gwPZ8hOMhvjpsZV
         DM2G1eEBopz+Wxc1K2rptzheMV/jVXsPA2W6FXpkgAbLqvCvEIh3h2nJYsZtEaE4MC1N
         DgD1qhUU/kTj4dTI7R+Yjh21rvociqdNvEd00d3cxQnzncIdplCYqPH4LqjRqFQfliHD
         8ngb/vA9HfiiXMBpy12C8g3s4g4xh++63ycTXCV8vZzhZBJn9bZvT5deaPa3LvUA+fWO
         lXIw==
X-Gm-Message-State: ABy/qLYyGVAjy7aLp6I1lb5KvM+qg6Moy+5Ez9PHPrG9oTSEa+NmxNsf
        0MvSPFQz6uL4FXkJ8ryGJ56gXA==
X-Google-Smtp-Source: APBJJlED6jt8xHaJu7Q+cJhP4iZsf33uSnbrn3oqSpD8pTr55ZYfnUl37FR46MpOM2b5hdLAdZh5/Q==
X-Received: by 2002:a5d:4b07:0:b0:315:930a:a962 with SMTP id v7-20020a5d4b07000000b00315930aa962mr14378852wrq.59.1689663514061;
        Mon, 17 Jul 2023 23:58:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adff10f000000b0031437299fafsm1449736wro.34.2023.07.17.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:58:31 -0700 (PDT)
Date:   Tue, 18 Jul 2023 09:58:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix an error handling path in
 vdec_msg_queue_init()
Message-ID: <1dcd0fab-eee3-4693-a7d2-4a72baef5c97@kadam.mountain>
References: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 17, 2023 at 10:09:19PM +0200, Christophe JAILLET wrote:
> All errors go to the error handling path, except this one. Be consistent
> and also branch to it.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

I sent this one a month ago but it hasn't been applied.

https://lore.kernel.org/all/b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain/

regards,
dan carpenter

