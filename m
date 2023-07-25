Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F76762710
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 00:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjGYWx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 18:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjGYWx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 18:53:28 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0667E4ED9
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 15:52:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2680edb9767so521702a91.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 15:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690325476; x=1690930276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruut7omQ7L2sKVwqZ5PqvzzZHI/rT4mTTYOmA/ozsbI=;
        b=dirhETpZkXjh04wZ36TgYcxIPCUAMqgLt15wuQFIr7t6LIf0PY8m2/HDzIm6+EBozU
         yOcM5KWB6lh9IvYElcFL823KC2gpwd76NHZceTzsOGgfeNWargYg3mzUJlFZ5w2uya+i
         +XmkNqquuee3oIWRY+tkOU26Wu8KxI0bOiQ9RLtmySMwGHuUMOpt8pz4TUOgGnxpaPjs
         f5QELIN+u9JkFqOv8cA7dcrRNh9YMHfthM7K2lURnHcxl3TQO9tDOGi2TtYnMF6Cpqx+
         USDmeFDvNJAXBEnc5zyv64EviCQSzBcs5ckXCDC9fnJuK3TcXzavcaEwO8rhYeeOMkMv
         DZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690325476; x=1690930276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruut7omQ7L2sKVwqZ5PqvzzZHI/rT4mTTYOmA/ozsbI=;
        b=AAOjBDhYxWLNGpMtx9TOcNsD0bJ2ygqccPFZZNlllFz1UWccpzCyIeriO56hJM9sfd
         XmIZdwqScaJ+bRUS2XzUdVwQlsGqlEpI1PT4RbFCbjlrGiIOxuvppq6qsqblHWSKKjhM
         rbbaCj+Et1Ajz+XW/ce+PRvaWPMqunWVPJi+kJT7y5PZEq+Ks0JD63X77O3MMNmvSXwy
         jauTv8x0VVAHtcyzp0PFBiRXbzYYkf/mewnJxJBnxxnX2qhCbffm+QZ4J5kjl2pDdf9Z
         079YmQMeuiJ/1KpAFJQuTFTqUCv0fwND0Mc8OmCBvjRu1AoQloyIfUPeSrncOwBP/fEN
         m+7Q==
X-Gm-Message-State: ABy/qLZnLYRISXK06r2RNPjp6c3RUbsGfgloW8gVPr32HKdVYYCSm4xx
        07St4spIGYKoOWyWnGBXhQL7ARNhLOy9CyDuYyo=
X-Google-Smtp-Source: APBJJlEXG4fhBHt4ao0+X91xgdWptfsQPaEzdfOccg425I6efSN9ZdDKlSc9QT7AizuP4fpi32+t7jSXDjhppKyH2Vc=
X-Received: by 2002:a17:90a:69a1:b0:268:196f:9656 with SMTP id
 s30-20020a17090a69a100b00268196f9656mr448407pjj.1.1690325475512; Tue, 25 Jul
 2023 15:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230720222543.1740198-1-festevam@gmail.com> <20230725200641.GQ31069@pendragon.ideasonboard.com>
In-Reply-To: <20230725200641.GQ31069@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 25 Jul 2023 19:51:03 -0300
Message-ID: <CAOMZO5C2X=KKJoje8r+GxrWLi=mQOqS0jZWMfaJ6yT6YcDozrg@mail.gmail.com>
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

Hi Laurent,

On Tue, Jul 25, 2023 at 5:06=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> I've submitted a v3 of this patch, along with two other patches, and
> CC'ed you. The series retains your authorship on this patch. Could you
> please review it ?

v3 looks good to me, thanks.

Tim said on another thread he would be out on vacation for two weeks,
so he would not be able to
test it soon.

I manually hardcoded Tim's value on the driver so that I could
reproduce the original 480 to 768 width miscalculation.

With v3, the width is reported correctly as 480.

Thanks
