Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0A145720A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfFZTxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 15:53:45 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:44636 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfFZTxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 15:53:45 -0400
Received: by mail-lj1-f181.google.com with SMTP id k18so2646780ljc.11
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sLr91XmmisgRGb0bcyxkQqcBOD/Z8uktuDZpnJSZdI=;
        b=McqxPzj1HEb3ujwotf36+OZaVfVVwLW5fI/CIeHu5kPFz6pklXu0szytwLn+mD+RNq
         1yOVDqC2fg0pQycVwRwBw0zqCHBUMZU4rfP7w2WSGbBxRB4LZgIzwAxxGnpLeXbIi8IJ
         9OCKhVfCH9ZV+W1uQuhtOh+kYG/OxFDJV7Fn7hxTqdfMlRrug350Plu2wagaTynG8SVp
         Z0WJXgI3EWm8bHvAmX1hLio+vMu3YXZyQoQzHgn3SJ8IIE6dGAug9sksmSMm61418P9o
         uZ2YnTGV8pEOPeymSIqvZtaCOJcbA5WUiLW0ZLhHplRvoYaCLF/KvcM/SLJCG1GRtzth
         /xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0sLr91XmmisgRGb0bcyxkQqcBOD/Z8uktuDZpnJSZdI=;
        b=d+stgRvTn1D78vxEEpkCrsrl5duuNDkC91OmigvVVKRqrLJ+4N/M/Ru21IR32OHt/R
         L/uBcUs6F2fMV0q39MLHuAuHlbsvRGJOkNOUIoA3rwqDUWZt2Ll7cUHCHRTJ38e0qJSO
         2P1K293bHNmkkedK/Y3OGqquLWuJOFfDimB4HONPYmPtK0HYRdcRrR5+tV/zFJrJvip9
         2DuYAY0JrRlhIFpKrMVuNKqogFjOZ9ZdMDmEctizMoJ6qUxrVS0Z+MKtEJCJDeJPaB6I
         WgK/lA5qYcXhpYr8bCknJse+d8EeW3z6KIsI2Q6zPUtMI9sXMeh+1nr4lubg4Ejs7zWH
         3UdA==
X-Gm-Message-State: APjAAAXgIv6tUKaj47hyGPmdxqgNK1ppC6hdJrMH6Tm9pq15Ew806oAT
        dacAIHbH9BSuvJk67jJg3JhJw8YVsJbO4xivc2w=
X-Google-Smtp-Source: APXvYqyT0Cy7Qp3tpCzPgzFJ9YbbCr+ZKO8GcMWQSCzIsSw4A6SUy5CIK4nf4ZsHXyWNb4PaJ/F9P8KXOGxM+4cDZww=
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr16348ljc.240.1561578822354;
 Wed, 26 Jun 2019 12:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190625203945.28081-1-ezequiel@collabora.com> <1561535121.4870.1.camel@pengutronix.de>
In-Reply-To: <1561535121.4870.1.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 26 Jun 2019 16:53:31 -0300
Message-ID: <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state times-out
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
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

On Wed, Jun 26, 2019 at 4:45 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> I think the messages could use a note that they may be due to a sensor
> or sensor driver bug, and that there might be image artifacts or
> outright failure to capture as a consequence.

Yes, this a good idea.

With this patch I could successfully test camera capture on a
imx6dl-wandboard connected to a OV5645.

Without this patch the Gsteamer pipeline fails.

Tested-by: Fabio Estevam <festevam@gmail.com>
