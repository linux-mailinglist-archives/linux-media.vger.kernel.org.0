Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D38F4A494F
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbiAaO3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbiAaO3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:29:06 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEBAC061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:29:06 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id o12so12151105qke.5
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EJDdBaZCJYnGSSHu5glZ7ZbWH/ryTD9xMdaecF2NgSY=;
        b=XahVcL8Ld98cmF6RcHTWC2zR+O4NcJaaNoNukzknBpKGDfsE2S+Lo40JnKuJcBP1Ls
         JKyfCrvwv+Vl8+j+Qy2SZPGJ4xBJ05HyWTtRABpY3nu8KHGisVqJ4O8eHa0+YL3nHhcp
         w28fl+iJMILvF+cW9lsZdFAfSEWRZvi74X/0yURFllkESg/QLqRT0/AooYWmY696SH7X
         MUfC9VSCQU/DlN029YbmJDxzK5QgGvWE5a3kH7scYbtI7l8lh5bNkvos7u4XD8cgvL7n
         sn9W3QqocNVO/lDIn5b50OjREAfdhtMLP6Z7LTeTNnyWveqPWNdQkyJVyuyKpiuI+Aoi
         72jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EJDdBaZCJYnGSSHu5glZ7ZbWH/ryTD9xMdaecF2NgSY=;
        b=Gcwspb7W5vpVvhAY5SyXWc3ZLtvswQ0isvuxDZrOsBeL+SJr1qyWG/A62lYNaXjneu
         +nvdchGImyyKbz+h7WpG0UmiXDAFEJSBhdWcb5oSXDlpa6s4jDwWK1Q9dqYEDYXjjF9r
         6egOTMxqeh63tHirw7oKfa/O2jBJ71F3tGIcO7KBeqpDSdRQeuGws4FZZrqxOcuycLUf
         8ZCehRijiLy+hD9DlJTA1uATk1nEEbGDWVPMoSiVBmZjWrvenp/HGMODTSPYvNRYjd7e
         nBZBg/9JKRvLOp3GRs/SGqjPUTBdhJx3yYxJJpYNZlz5d1H0DvgQMa915cxC43y0jszc
         IUuQ==
X-Gm-Message-State: AOAM530OP/4EpbFEgQnr/C2TTNUb2ZygqSXhpR3pnS4dOSdSEgl6jMrm
        YNiNWyk4jPgen6Hl8XIMpteMBA==
X-Google-Smtp-Source: ABdhPJzMTTLBhN++GA1x4qwul7iQLmUiGpX/urDmEGYiLbJoQH1uyFpaZN+6Y1twwxpHYk8sfV//mA==
X-Received: by 2002:a37:9b96:: with SMTP id d144mr13115527qke.164.1643639345360;
        Mon, 31 Jan 2022 06:29:05 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 18sm7865382qka.126.2022.01.31.06.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 06:29:04 -0800 (PST)
Message-ID: <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adam Ford <aford173@gmail.com>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Date:   Mon, 31 Jan 2022 09:29:03 -0500
In-Reply-To: <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
         <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 28 janvier 2022 à 12:43 -0600, Adam Ford a écrit :
> On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Hi Adam,
> > 
> > Jernej and I had to deal with user report which show a stride issue with the G2
> > on Allwinner H6.
> > 
> > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-h6-and-r40-boards/?postID=166086#post166086
> > 
> > We quickly found that the stride alignment set to 16 needs to be 32. Though we
> > noticed that this is only needed when using the G2 postprocessor (NV12), while
> > it worked fine with tiles (NV12_4L4).
> 
> Out of curiosity, would it hurt to make the G2 alignment to be 32 even
> if it's not required?

Aligning tile to 32 can be complex, I don't think the code is ready to handle
padded tiled buffers. About the post-prob, I'd like to first understand why is
this.

> 
> > 
> > We were wondering if you, or anyone here on the list could test this on IMX8MQ
> > and IMX8MM. We'd like know if this is specific to the older G2 on H6. To trigger
> > this, you need a video with a resolution like 1552x1080 as used in the report.
> > We can help you get one if needed.
> 
> If you have a video you want me to try and instructions on how you
> want me to test it, I can give it a shot. The imx8mm doesn't have a
> video display driver yet, but I think the imx8mq does.  I am not as
> familiar with that board as I am with the 8mm.  The testing I have
> done to date has only been done with fluster.

If you have fluster/gstreamer ready, and some display, I suppose you can try and
kmssink (worked for me with the vendor display driver). To get the same video,
you can probably download temporarily that youtube video with youtube-dl,
careful not to share the file, this is copyrighted content, but it ease testing
and debugging, so I suspect it falls in fair use (INAL). 

youtube-dl -f 248 https://www.youtube.com/watch?v=TUVcZfQe-Kw
gst-launch-1.0 filesrc location="Dua Lipa - Levitating Featuring DaBaby (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec ! videoconvert ! kmssink

regards,
Nicolas

> 
> adam
> 
> > 
> > regards,
> > Nicolas

