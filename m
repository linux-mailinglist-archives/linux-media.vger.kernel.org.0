Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD6B152157
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 20:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgBDT6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 14:58:55 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37789 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBDT6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 14:58:55 -0500
Received: by mail-qt1-f195.google.com with SMTP id w47so15335125qtk.4
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2020 11:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nUYiDfAhgCZXRYErtoRQy6/rVWr7Gr3L/ebDcQHtW8c=;
        b=rJteDZ77rao5hGEilyGPjz2uLvmX8nHdHJNyj2fs0bRbiulWazSW29HRjw63ZRbMSf
         YOOaGro7M76kDhN4Pz8lQrpWqWnBaPpT9idY4uJoSenhaB+gJ1JRMexyeo06S+2aw2gb
         N4EJZjiOwtvpE+nFn5BkwAbfkp+8K5VhwRdXCPoUnpfRczgprwqze5jtEZJlBhK2DCtq
         YSOIAIgdtKzYH8bdDy4H4r/xQARIpX0ec7j1YFcnVZHmx12YjtNWwXNPHsQejHEGqP1z
         LqiNMp5vIF2kBmOlrsy/LXnI2ZD0klA2C95GIVh1DOlQ0VeqogrNUfFUcw4Scbhj36he
         RYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nUYiDfAhgCZXRYErtoRQy6/rVWr7Gr3L/ebDcQHtW8c=;
        b=lYs/Ji6pXmSnleqkZY1iR0CEfYT3qoapuPvLgGHLNaehpO7fS0cpnGlgcf36XSoIbZ
         CtiF6lmxeE0bDkwdRzViuQBXhhIjFU77NGxvoxwPc/fk9I3cJr2iXY1wSEVVfUp1LmE/
         UiyQMF0D2c2MIpq8Ev6ar3MjsE3h6JDSuzkk9kWbrwQV1qX+3RCGLgMRC7zwEQxPpQ8z
         JBRm4n3HO6WdHKcI84CnmGLaLfKl1YJKpwSE/aCnNsmOEKPARnyuQECppwtJMRtF1bSQ
         i6cNP3Ea4GCj0q5nt74WyEHJxmVq4FRL/Jj6rNIJXWY6KPVt0NSQ0+YlkCMZH3gI8rv9
         Hhtw==
X-Gm-Message-State: APjAAAWugnWDKpAVRCiYCuAhexh0FYICNeUrLNx2N/ylygDTEoV/aI3c
        AY1RjqFTlxtdqK1W8byZ10rHcg==
X-Google-Smtp-Source: APXvYqwWXd+xCIFH82pgvzLUel/qSAxcq02npWNuT+UV/0x2XRvUupDPcFmEm6BmLWUk12NmYXKi3w==
X-Received: by 2002:ac8:70d3:: with SMTP id g19mr29789882qtp.209.1580846334248;
        Tue, 04 Feb 2020 11:58:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2610:98:8005::527])
        by smtp.gmail.com with ESMTPSA id o187sm11852053qkf.26.2020.02.04.11.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:58:53 -0800 (PST)
Message-ID: <ef94a7c141479622ecc499dba4da0583a4ea315e.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.6] hantro: Fix broken media controller links
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org
Date:   Tue, 04 Feb 2020 14:58:51 -0500
In-Reply-To: <20200204193837.16021-1-ezequiel@collabora.com>
References: <20200204193837.16021-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 04 février 2020 à 16:38 -0300, Ezequiel Garcia a écrit :
> The driver currently creates a broken topology,
> with a source-to-source link and a sink-to-sink
> link instead of two source-to-sink links.
> 
> Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: <stable@vger.kernel.org>      # for v5.3 and up
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c
> b/drivers/staging/media/hantro/hantro_drv.c
> index 448493a08805..840b96bee082 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -556,13 +556,13 @@ static int hantro_attach_func(struct hantro_dev *vpu,
>  		goto err_rel_entity1;
>  
>  	/* Connect the three entities */
> -	ret = media_create_pad_link(&func->vdev.entity, 0, &func->proc, 1,
> +	ret = media_create_pad_link(&func->vdev.entity, 0, &func->proc, 0,

As for the m2m comment, some local define to name the pad index would make this
readable.

>  				    MEDIA_LNK_FL_IMMUTABLE |
>  				    MEDIA_LNK_FL_ENABLED);
>  	if (ret)
>  		goto err_rel_entity2;
>  
> -	ret = media_create_pad_link(&func->proc, 0, &func->sink, 0,
> +	ret = media_create_pad_link(&func->proc, 1, &func->sink, 0,
>  				    MEDIA_LNK_FL_IMMUTABLE |
>  				    MEDIA_LNK_FL_ENABLED);
>  	if (ret)

