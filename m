Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F2B5A7F6
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 03:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfF2BM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 21:12:28 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:40482 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfF2BM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 21:12:28 -0400
Received: by mail-lf1-f53.google.com with SMTP id a9so5106255lff.7
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 18:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8Nau7rmd/HTQmdLOBOYeBE94Io0/E62ZoA93R7+Tts=;
        b=AlHCfqI3wltStdOsjfdHMEilwLJrJqhkN0VERMiuhIGO1c25qn7tyic9UBzQivHJzm
         K7DCoUZEypF9UFnC1V0ZZ4kW1OUDvpNYWpMB+kqKg3Ie6iT4x/dkMtH6a5nu8yR4qF6+
         w2i31eYnXaAurvfTGrwhe0OCjC/GtGzoxMzLyZ98hiyYDAyhEngBdRDt6jPX/TGkktvJ
         G+c/E2H0wHO3dqWrdim6m1Tr8Cdis1ILETctn1pk76hPex80rjWSFcOHBkGoX0tZLEzf
         pcLbP2wRjCZy+IlIXbx7THFZ28+MAF/0a/G6URmALQh5qWcM7V1WiSfLUWe7PJ1kNj4y
         9qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8Nau7rmd/HTQmdLOBOYeBE94Io0/E62ZoA93R7+Tts=;
        b=qVBNvXHyz77FeuvbE8qGGvxv5BSls+XmOggJOmwmVNcaqOupqntCv1KYct0ORhuBjr
         ulYsugrZpC4GDqD3sxOexuGe+oxEDNKwxf69lG0Zb9X1gFE6ByCQqt1FcER1NhMv+LHP
         0zqBwCRh5weWbMaBEgW2XJLcnXbPgL2MI4rCpQXnAsezbYaYKjJrHMlHlA/V+QY1pgmW
         Hdf5iIH6rApsVxFgLohG+Iy0D3rwBUY2ACFAuQZ3O1+OyBlZ9IgG6mYfkvhNC5Bq5kSf
         ZJ6bIMhuGqtCvq1kslZrAO3WYT53VahCi2Hr/DwbMLDl6eR/l7qq6CcHgGR190EttSZj
         MZ8Q==
X-Gm-Message-State: APjAAAVZYiRm2x747VmkEBEr/LZ3hM/d9L3kN2u46i3SNjSbkGaw/12U
        3dlzLFFLQE79Ki6pOh3niBJyi9npWpstEeszQUo=
X-Google-Smtp-Source: APXvYqzrvVl0CEtu4NtCZ50G29N2fJKK6G+zGlKv2QJr1bZBsZnlc3KUOaMl5df5zAIKuSo37wx1kIdUeNALBNVOZPg=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr6273334lfp.90.1561770746548;
 Fri, 28 Jun 2019 18:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com>
In-Reply-To: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 28 Jun 2019 22:12:21 -0300
Message-ID: <CAOMZO5DktjDM-YE7g-bu+DgOZT2SA+FAta_cj2PZV0SLbiXK3g@mail.gmail.com>
Subject: Re: Setting up the links for imx7-mipi-csis
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Fri, Jun 28, 2019 at 7:03 PM Fabio Estevam <festevam@gmail.com> wrote:

> The first command succeeds, but the second one fails:
>
> # media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
> Unable to parse link: Invalid argument (22)

I have also tested it on a imx7s-warp and I got the same error.

Please let me know if you have any ideas on how to solve this problem.

Thanks
