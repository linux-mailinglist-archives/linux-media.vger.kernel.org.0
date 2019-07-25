Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90EE774F99
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 15:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfGYNem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 09:34:42 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:44347 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbfGYNem (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 09:34:42 -0400
Received: by mail-lj1-f175.google.com with SMTP id k18so48000387ljc.11
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 06:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGrdbFmCkA0Jhq+iC+B32/63wD6iH3g/gNjQ6Yy5tL0=;
        b=ugi8MkvXfdPoh+LtN3tf8UBwLPZhdDr+3+5tKtf3mBYMxmHmgAMGn0DHHv6IQxqkME
         Z87YcP+lebo0hNsZ1wDi0ZyKmlEjQH3EcWzrS/c6CJSlsuF0dY7fOMZuczeQ0LvOixex
         1klHk7XiCXFnZZtOlom5zDO1J6o7anihbGSRkDZqf8NLUNmXhfZfv9ARql6Bf1SPrcKG
         wsM4IGY1Vml/lgPfdrBL/ntCFwO5GJVab+U0babbM0eD5CSvI5ueCxtp1M1jeEnzVzAD
         8SCNhTOC6Xh9YK1h2wF4Z12gS0/cwYxf0Od27En2Jjvf141u3DjanUNjQhBywanEYZ6l
         qN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGrdbFmCkA0Jhq+iC+B32/63wD6iH3g/gNjQ6Yy5tL0=;
        b=HzgyYXb1Kik+tTDYkUFPKsUbo3xqe62eC8zStIO8YMUAkCookFgJgv/9XiuFjZ8rob
         NUlv+pGlqFdfXyQU4DubzO3NLNgafg8LQjRyt0a+cnQGo8VCpVxFC6Qhrdkj53G6JxDL
         G+C9PsOWrUS73MohAV7Dsi3Aj84Wg0mqNrsjZCHOcSSe4ZZSg8f6IEE+bmHZv3xsC5aD
         F2hEzzHkQxQ8cdAAvim5vD5rpkSzBzwkmiozGYtmBOG2HxsrK9UiTv3P1U1z9gQ8T87P
         iPZQlE9z8NYkdFAqRTPDf9iQndh2C0KCjVH+/bWnRQcRtqny4ZpuFUAaf/M7dBrP71di
         Rv4g==
X-Gm-Message-State: APjAAAUv0Vjv2VgOyIfsI237ukh+h8O5lT7fKz+Db9S/Cx0TI6oPOt0i
        +iVsF169hNQ5KBlwtPRMDq9QsQP+ZZHfCN5YItZi6nl+
X-Google-Smtp-Source: APXvYqwgU4OavGY+VVs23V/hcuM19p+SCiouzMAHci9ExWqQ8jo3GBevsUvXlIe3vkwO5SXJ2YSlkE3a5OuGVWi/lsw=
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr8953909ljs.44.1564059754746;
 Thu, 25 Jul 2019 06:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190629121623.18069-1-festevam@gmail.com> <20190725074123.2864b148@coco.lan>
In-Reply-To: <20190725074123.2864b148@coco.lan>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 25 Jul 2019 10:02:36 -0300
Message-ID: <CAOMZO5CNN0Qu3dyMWN3=3U4Ooq8oxN=KSHJKgC7UYBoPq-NXJg@mail.gmail.com>
Subject: Re: [PATCH] media: imx7.rst: Fix the references to the CSI multiplexer
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Jul 25, 2019 at 7:41 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:

> Did you check the "make htmldocs" output after this change?
>
> This code-block is broken, as it starts from column 1.
>
> Please add a tab (or at least 2 spaces) before each line, in order
> to make Sphinx process this code block.

Sorry about this.

I will rework the patch and make sure it passes "make htmldocs".

Thanks
