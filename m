Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565452E988
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 01:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfE2Xs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 19:48:27 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40693 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbfE2Xs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 19:48:27 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so2730755qtn.7
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/l/nMGVzVnRiyf748AwJNk0Lf7Zh5VjndDZX/l0fgH8=;
        b=F1opT5xRs4+qIzSJztkuAa2x3I1JdugHSklcxR0Gqv+BEbPhuB8wIRhZJxXsQQ6L6z
         i1xY3PAnvBkZzH4K/Bi5PgvD36QWebwJUVmve2gRZ+OJTCK+lN+IAH0x83m080Mo+qiz
         tcdNvKJiI+dk877HQT5fMrZIYk+KTkTF+cn5ShGz2cFrPMsdMhl2je8IenXMkRy3Wn3a
         wZsCUcSLg4lo9D1VdHcn33z6X9mqR4EuDVIcPxUXtOaAY5o1jnbsyDwuMupj49Xn2We2
         GuUcQTuaHJgsVKrGxoNYny6C0R2XSroZqCL49CwUf9/DaNn7XOk0Zh+Idp6QIEK32cSl
         mpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/l/nMGVzVnRiyf748AwJNk0Lf7Zh5VjndDZX/l0fgH8=;
        b=kRL/0HGbNFalD3IQyzjKXZ2OrdKdOj+8y8wpEPx1jZ6rP9rdaR1lHJztpohY1Y0t1f
         H4ZxOEQGqkh1Mdafm38hD3TQeZP1jlJncXj3tXM0JLrDZNRoM4xIUbWmhrcZ0VRdx5YM
         X8ZkqRKp0Hqyzy5fz3pentNa2VSZHMkBtlOs3olW/U2ToAm0hZjAzT32lx9Qrw6IQ9D3
         f74fzhz8i5LJSaiL4fr1NvRjbVe9ZmeS0PK5dRND3VtGlXzHtdbZh76MAaSjRHUQ9+dE
         x7ZB2kbJ9wq1UGj5jnYR5etl3VvFD8VlYfc+nkkfN6L03vNlIiM3HaZ1QzJKNfWFfErp
         uAzg==
X-Gm-Message-State: APjAAAUOoN8RfpL2rsW9ttXudaLivMkGhUnxOHypFJw9pDO/KMXU1ZIV
        WooI5TI+tMtYdbB2Us27zVA1WA==
X-Google-Smtp-Source: APXvYqyQM/G4+EcfKEeSU+tBU0rg3WmjwUDgX88j03cUMxsBVRgHYxBXKFi/u7h4GucRyp2eXH3Rxg==
X-Received: by 2002:aed:2a85:: with SMTP id t5mr703708qtd.26.1559173706269;
        Wed, 29 May 2019 16:48:26 -0700 (PDT)
Received: from skullcanyon ([2002:c0de:c115:0:481e:e17e:2f68:43f8])
        by smtp.gmail.com with ESMTPSA id m5sm733268qke.25.2019.05.29.16.48.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 16:48:25 -0700 (PDT)
Message-ID: <04d3079189389f87f3e70c05136bac8fefe98b26.camel@ndufresne.ca>
Subject: Re: [v8] media: imx: add mem2mem device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fabio Estevam <festevam@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 29 May 2019 19:48:23 -0400
In-Reply-To: <CAOMZO5AjvxR0LZQe2odVh29JtpkRkHJN5NwfUaA-wB-Fm0k_vQ@mail.gmail.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <20190529154431.11177-1-TheSven73@gmail.com>
         <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
         <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
         <CAOMZO5AjvxR0LZQe2odVh29JtpkRkHJN5NwfUaA-wB-Fm0k_vQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 29 mai 2019 à 19:19 -0300, Fabio Estevam a écrit :
> Hi Sven,
> 
> On Wed, May 29, 2019 at 5:55 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> 
> > I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.
> > 
> > Performance is still much worse than the Freescale baseline.
> > 
> > I am not at all worried about vpu scaler performance, after all v8 is an
> > in-progress patch.
> > 
> > I am much more concerned about the CODA h264 slowdown. My 1080p30 test
> > video runs at half the speed compared to the Freescale kernel. The best it
> > can do is 28fps, which results in visible 'jerks' in the video. Note that
> > this is without using the scaler.
> > 
> > Questions:
> > - is the performance slowdown a known issue?
> > - is there anything I've missed in the gstreamer pipelines below?
> > - is there anything I can do to help?
> > 
> > A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
> > $ time gst-launch-1.0 filesrc
> > location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux !
> > h264parse ! v4l2h264dec ! kmssink can-scale=0 sync=0
> > real 0m 32.01s
> 
> In my tests I had to pass 'capture-io-mode=dmabuf' to get a smooth
> video playback.

This is the default since 1.14.0.

> 
> Please check the explanation from Philipp at:
> http://gstreamer-devel.966125.n4.nabble.com/IMX-Scaler-CSC-m2m-driver-td4671175.html

