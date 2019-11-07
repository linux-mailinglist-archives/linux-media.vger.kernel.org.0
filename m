Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEECAF2E3C
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 13:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388513AbfKGMiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 07:38:52 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42127 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfKGMiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 07:38:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so2078697ljc.9;
        Thu, 07 Nov 2019 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhA+48hCGuXsICyIDlmiLuXwLznM2g5J4GJhQPgRqp8=;
        b=Mbk148mVLYWiwBPvoiibkQt0FyNlTskbhre5JrDvTWiABTQNh8j7SopLFOfKc+/YTS
         yo6yXMK7gcUSw0jy+pVxBuXkSaB51OiWHgBsF25BSPub1m4uDWpu6hlfy4CEIWy3mgwH
         E3VRHKVE+KJwgkkGp5ZxEjyoZSUdUg7Drdz2qV7EYReq3cYuAB7z5iRsMpYrhDKODJVp
         8QCrKVCddvk/Ays9wSxAx5cRQIKPacrESoPPR1epRD0aaaEdjNrvdIAys3wS+o3o6Rn+
         ECNYAI8VB8GEw6UQcfTACoe8vLvl9J7cktIFEAKTe5O/SqS7wtBBbaQ4zTZMEnZM0Lip
         LLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhA+48hCGuXsICyIDlmiLuXwLznM2g5J4GJhQPgRqp8=;
        b=kCo6n2GRoD77W6lNgVDYtWkv0+qtvP3XLTKKEJehSKcx44pxxAG2ieaosldBb+tqWb
         /k5fASDJ8J4zma8PIZa3+d3UH0tj3Zr3dQWjW2F8NVs84K3zUc13eOEYkYJlR4VHP5ho
         wpC8UWDyQ5wMS2lq7jIEyrYxja80iJGrnlib23nblB5aucUm8vLdxda0G3J/M80Jew3h
         G1RWR1nmWYY6VHyTmH6ztwgDr3xyKAHqLOY2sYIjeTcJPYqRjgC1UCDuJ47ELtpDw2Pw
         eOm95esWmRFIJ8Bz+jgrMzm11+7dugWZS9RVvCKFQg4eqbxxKSDKQE8Fct2rHMNleQmy
         msPg==
X-Gm-Message-State: APjAAAW6qFne/fPjrog6qPoC8D4OV5r60WKOFXPwby3HxlgEtcuBGe8p
        BhmvNp7YI6/oaoBQBqFEwwfUHB0ISLItIEhB4ZBRqB2O
X-Google-Smtp-Source: APXvYqwFQSc5YpxGKhjpxmhAksjaEPI2kFRJke8NNgiEUxnRLf9iwHicj7OoQIVvShzX1w+NdUXzUY294KZ8D+y8SzE=
X-Received: by 2002:a2e:b007:: with SMTP id y7mr2287841ljk.69.1573130329729;
 Thu, 07 Nov 2019 04:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20191003144624.17899-1-daniel@qtec.com> <CAPybu_29m_PvzfA8TQGNANgQ_QFEQbhT-=ydQkE8RPJ_G_-1uQ@mail.gmail.com>
In-Reply-To: <CAPybu_29m_PvzfA8TQGNANgQ_QFEQbhT-=ydQkE8RPJ_G_-1uQ@mail.gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 7 Nov 2019 13:38:33 +0100
Message-ID: <CAPybu_2zLLoQaLhaBdG+1BfeeGxE42bZmds2Rgj+fStfCPehaw@mail.gmail.com>
Subject: Re: [PATCH] media: imx214: Fix stop streaming
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Did you have time to look into this patch?

Thanks!
-- 
Ricardo Ribalda
