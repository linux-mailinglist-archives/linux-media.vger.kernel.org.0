Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8945A582B6
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfF0MjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:39:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43931 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0MjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:39:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id 16so2151150ljv.10
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFfBdCwzR5WJi05AzFMXnNl2/J3pELZNgx1NLNaG3nw=;
        b=Wf7CRbAzU/C8JnHsmBde4LC/BEy4SgE4tNB+Oscsfwjc69/weeHMJ8EL3ZqbbLYE65
         +UqeZD4elFx/a2tVW9gcpeo6no+RLckIfaRuPdS4rp6a8dZR9N5xNwk9xyXRigBaYHRz
         9rDRmBET/7SOXuyi0rwpaLjpM2OShsl5+pdDhkOPJBKn/AX/YZZxnhNDU++IlCHu3UCy
         nv8idqEnP5QPsTTi4B4BvV2zXhznOq49OHaLCP4ponAxSH2aqeP76YQRch/JbVWTXZat
         5JO5H8sNCkLV5eehjjXUhHftjOlJ16dt6byQNb0O7GTk4AVlsOGvM3QWRWBSf1ZzaGKd
         qP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFfBdCwzR5WJi05AzFMXnNl2/J3pELZNgx1NLNaG3nw=;
        b=XUAC7HSKnmbNFrORzW8a8F6KA62pwmOyQlMO6+pGfQD4NsMP6i3XUgFZSfGcASccm/
         qzLNQ9VqQqEktfTIvxuSdvOw46qLhBSTnS4i1kB3O8plarWjgIU6ud6MOrw+L3yLlQc2
         Hk3Zb1ssOL31dctM9wxcg5d8wF/SWjBebwZVDn0r8WW5XkiDKDSkugkZFn6xF4f+cpsN
         +WVtktK6ZprVV9zH+zV+PtW2pdHREELYrmOpcC+N5883pWLgnlGdCXYaIzijKOxKmiPN
         hey54cHqnJr+HyT6I5R1+SMb2WhYbYfQpP38oh1suSF23Av5RVYQum5w5sJr5c8SaVlV
         Zpew==
X-Gm-Message-State: APjAAAXzGdSgC3aeVgozBhp4c3d9XFX2mW52xjVmtWnu7MK4Hn4bzdpv
        QafYRFsSd4fkNtTaiAok51U0snEsR9tlchhab3WQQhih3ZQ=
X-Google-Smtp-Source: APXvYqxg08d9JsMDJnmhN/TFQkRKc2je/qjpDXoZ4esAT6ESpxrSQ0/GhHs0JL9dYSeTn6ThIDRbr7yiZ1t03zu0V/8=
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr2542780ljc.240.1561639138643;
 Thu, 27 Jun 2019 05:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190625203945.28081-1-ezequiel@collabora.com>
 <1561535121.4870.1.camel@pengutronix.de> <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
 <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com> <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
 <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com> <1561624997.4216.11.camel@pengutronix.de>
In-Reply-To: <1561624997.4216.11.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 27 Jun 2019 09:38:48 -0300
Message-ID: <CAOMZO5D1Lq7MuK55hydP3JNGki71iNeubzfUgAvVhEDuzDcZFA@mail.gmail.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state times-out
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Thu, Jun 27, 2019 at 5:43 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Are there any visual artifacts in the first frame(s) in this case?

I do not observe visual artifacts when running gst-launch-1.0 v4l2src ! kmssink

> > So in my opinion the next version of this patch should make LP-11
> > timeout a warning only, but keep the error return on clock lane timeouts.
>
> I agree.

Here is a reworked version of Ezequiel's patch as per the suggestions:
http://code.bulix.org/g5qap5-780475

Does this one look good?

Thanks
