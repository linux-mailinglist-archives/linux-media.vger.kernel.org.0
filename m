Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B3B762713
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 00:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjGYWzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 18:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjGYWyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 18:54:47 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CF230E5
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 15:54:07 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-265c94064b8so710957a91.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 15:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690325585; x=1690930385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4js+zAIprHaxZFcJbOXP+JFOfKkmNx/2NhJ9kPan5sE=;
        b=CeM0kGKUWKH5syVIc3Zrkb0zKQVfTtvFp0sXZlWGN0JNm2ef/7RegIgZnxHVRTRiVR
         huqfCT0Ufe9omJ8Os712hvpTrLycsFpKpMz1xG/PKNQiaYi5tIFCh0lAF/m7UvJ9ToaG
         q+Wi6O3sFYcnTdgPJX7wG9uZ2K7TZPuwoTmp3AijGBZZZ5TNCNM8u86wlB4ggswuDKCI
         GDVdrF3K/2OzBhIT9dcGFFHhU8xBSnlEy59WN7UEliPtRnWVdOpTPPb8U9TlBp/xLEdf
         HiMT5NFno5kGW4R3raUmW056/DOk33P7vUFe+TEh0z1X6yFO33aOihoYipy5udHE/wS1
         i/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690325585; x=1690930385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4js+zAIprHaxZFcJbOXP+JFOfKkmNx/2NhJ9kPan5sE=;
        b=Ie8WXSW4vCXyRdBDdAw/edv/tOxwylxW+TAg7GvYH6s2SE3O7xPRiCIMhMWWiBdjOR
         N3Qc5SHMeqY/5Vx8MZY4jIkI53/MO0QZCi7s2bWfvOcaHx/QwZ6KCCx2sBQywKucJSu4
         +nAuR+Aa0a2sVCcuk7FXGFAbfrFY+B1hsZbig3oMlS4FU5UOzeSag4IHH4ua4v55hprZ
         y9FLnP1DuGgT9AOzFxVGqLUYdh9u+3Sw6KhErtGJoHRHbwBgO35KNsEAQhBvhTu7uzgb
         XSxT55e3uxTvVyeFa2xhMVM9XV4bpTpYsn2x8iTDyvhEZ+gjbOJgVktOTl303CyuIj5F
         0SRA==
X-Gm-Message-State: ABy/qLZjmRUkZt/69N2sut7oiqiIe9pSf325wE1wdbqgLZlN93rJOeAv
        xjEreu+J7BC63UDc0uXFYLVhIwrgz2gnxGFo4cY=
X-Google-Smtp-Source: APBJJlEfK+sZK2Pdxhjmif7IbScBxJz4I1oeF1rE3ktwT45pvA7znCivtdwjplBszvTRbSbVC4iRmKfx63poyoukojI=
X-Received: by 2002:a17:90a:85:b0:25c:1ad3:a4a1 with SMTP id
 a5-20020a17090a008500b0025c1ad3a4a1mr443872pja.1.1690325585599; Tue, 25 Jul
 2023 15:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230720222543.1740198-1-festevam@gmail.com> <20230725200641.GQ31069@pendragon.ideasonboard.com>
 <CAOMZO5C2X=KKJoje8r+GxrWLi=mQOqS0jZWMfaJ6yT6YcDozrg@mail.gmail.com>
In-Reply-To: <CAOMZO5C2X=KKJoje8r+GxrWLi=mQOqS0jZWMfaJ6yT6YcDozrg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 25 Jul 2023 19:52:54 -0300
Message-ID: <CAOMZO5AS5Y_R2xCEs_QZGz8qmQvaQ83ZUDB1OJgawyA8XG8d2Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: imx: imx7-media-csi: Fix applying format constraints
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        rmfrfs@gmail.com, alexander.stein@ew.tq-group.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 25, 2023 at 7:51=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Laurent,
>
> On Tue, Jul 25, 2023 at 5:06=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>
> > I've submitted a v3 of this patch, along with two other patches, and
> > CC'ed you. The series retains your authorship on this patch. Could you
> > please review it ?
>
> v3 looks good to me, thanks.
>
> Tim said on another thread he would be out on vacation for two weeks,
> so he would not be able to
> test it soon.
>
> I manually hardcoded Tim's value on the driver so that I could
> reproduce the original 480 to 768 width miscalculation.
>
> With v3, the width is reported correctly as 480.

Sorry, I meant the width is correctly calculated as 640 here.

So all is good with v3.
