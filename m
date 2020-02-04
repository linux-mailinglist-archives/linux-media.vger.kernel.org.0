Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8174C152142
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 20:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgBDTj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 14:39:57 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42454 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgBDTj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 14:39:57 -0500
Received: by mail-qt1-f196.google.com with SMTP id j5so15281650qtq.9
        for <linux-media@vger.kernel.org>; Tue, 04 Feb 2020 11:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=n1tREzyqXwwhUhuuBvd3gVORNIw826+UDnjAUC/uDao=;
        b=1aV8a88s3A3nQDtrCldNserHQ0/WHTTpixXVuyKGvfDJUDKnI9vZOhDEPbdz2V8vnA
         x9595a4oi/eoe0empiIJOd63zyKk6K8rGu+5hWlb73U4DccIds0rh3QNMUsGdMg89rPb
         iLAsfBTRehNCynjFGu3O/8KWmvvtkzcXaHe9UyrFr+0ThTNbj+sI1HjTYkj+zZ1a2UyJ
         aHiWqzmJfdYnr+cU/bvr5U8+vApIQcyxUfAZdfUzdv7Cu41WZq6AkwXaA70m7F5wiQGo
         EwwQ3I2iI6bTVOQrxEu8rK510vagFhpxMFbKt992ipmmMgDnok4FwqFOkvf+qclFNl3+
         Ul7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n1tREzyqXwwhUhuuBvd3gVORNIw826+UDnjAUC/uDao=;
        b=dD1/fu9PJIzI2W0+C7jJqOkBw15kkvKV8z3G7If/uZMyie4eCV+9aCa/Z/ZKlIA0kh
         ReFdLbedLwHBth2cLZ0Hy3i2ePIMSfnpoWtzXOaUqKEwhn3szBbSYo7EAyVVY95JJG/6
         vrfLTJkbn0CbocePQweqZZE5zsqnmDfcMJMkIVE9XyJtHuGxjK/jC0vu9LztaPSB35iR
         cdax9Rep382V3OhNBy0bz8JUdjBbwFKqxNs27VrxGpLnD2lWjutya7XcvZGhVqUdlYFo
         GwQPGxwTVWBRyyUSRUZlyRZwEFkpKHI+cCx5Fbg00BZB+HI8uW04R+Dea7hABbL67v1j
         1BIA==
X-Gm-Message-State: APjAAAUO/gCFyOkBsFmozAf1Sv5bjpoqL4J0oTOWms0MlsHUqRR9ohJf
        eUKsCATzS/XW0T2u3OoaILuovQkdcoc=
X-Google-Smtp-Source: APXvYqx+h6Me91jUhApy0dh14d4maKitIZ7wNO7Tv7BXEMKl+Y5Piv69i5MzrckYnrLiPK25sUulNA==
X-Received: by 2002:ac8:461a:: with SMTP id p26mr29043434qtn.317.1580845196257;
        Tue, 04 Feb 2020 11:39:56 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2610:98:8005::527])
        by smtp.gmail.com with ESMTPSA id v1sm11579884qkg.90.2020.02.04.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:39:55 -0800 (PST)
Message-ID: <7498931438e4e58d3efc51ff34d6a9752cfc729f.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.6] v4l2-mem2mem.c: fix broken links
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 04 Feb 2020 14:39:54 -0500
In-Reply-To: <8974b23a-6823-d47b-fda4-fe9bd6f7e6d1@xs4all.nl>
References: <8974b23a-6823-d47b-fda4-fe9bd6f7e6d1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 04 février 2020 à 19:13 +0100, Hans Verkuil a écrit :
> The topology that v4l2_m2m_register_media_controller() creates for a
> processing block actually created a source-to-source link and a sink-to-sink
> link instead of two source-to-sink links.
> 
> Unfortunately v4l2-compliance never checked for such bad links, so this
> went unreported for quite some time.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: <stable@vger.kernel.org>      # for v4.19 and up
> ---
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-
> core/v4l2-mem2mem.c
> index 1afd9c6ad908..cc34c5ab7009 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -880,12 +880,12 @@ int v4l2_m2m_register_media_controller(struct
> v4l2_m2m_dev *m2m_dev,
>  		goto err_rel_entity1;
> 
>  	/* Connect the three entities */
> -	ret = media_create_pad_link(m2m_dev->source, 0, &m2m_dev->proc, 1,
> +	ret = media_create_pad_link(m2m_dev->source, 0, &m2m_dev->proc, 0,

I think local defines to give a name to these 0 and 1 indexes would be more
readable. Note, I could not test your patch as Hantro does not use this code
path. But I'm not worried, this is covered by virtual drivers and tests.

>  			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>  	if (ret)
>  		goto err_rel_entity2;
> 
> -	ret = media_create_pad_link(&m2m_dev->proc, 0, &m2m_dev->sink, 0,
> +	ret = media_create_pad_link(&m2m_dev->proc, 1, &m2m_dev->sink, 0,
>  			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>  	if (ret)
>  		goto err_rm_links0;

