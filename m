Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B97CAE9C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 20:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbfJCSyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 14:54:07 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:35509 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731156AbfJCSyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 14:54:06 -0400
Received: by mail-lf1-f54.google.com with SMTP id w6so2665321lfl.2;
        Thu, 03 Oct 2019 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ez0vzBljWTiUPJRxq3ritD9VFDP65l68//xJ/PQjSxI=;
        b=U/gGVbwNV43oHYk7RIPPBJCgz+p2rrcsYzuJpOwD+Mk06lXD9aN2/i11uAWciGMYSB
         OJfRfDG7TdG3Khr+oyKys2GbFWJyvcVlXsiBOLbavdAmF9EPQ/oEoUefOpU+yBP7rNaN
         DKBKWRugLhYD7ZvnSfnO+qcALKFuGr9JWfvqSlSvFhpAO7YQwtJNIRV9LFd1NONWC7Lu
         e7lFW0YlAtb3lBDLrnoltkXB9NOvme0b2pTMRV/M4/UqR8i6hQx8h/kGfv9C4Ps3kfCB
         Q+5phyABewioDuyHdTMq/EmQWLUm+5AsYgASDR/o/+XcejJiXux35wpJdlUAtw2NUn2e
         FDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ez0vzBljWTiUPJRxq3ritD9VFDP65l68//xJ/PQjSxI=;
        b=HSymdIMux+4shIYsRlypZv9IeHSgVc878PZncSxT56A1LIQK5PGGgX/2tYZMpAoAQG
         QrZVy18sQh8c0cAuYxcZEFoo0kWDtrnm3aGxh9Mk8cke2hwp7ncDSit7X7FQg32Bky1F
         Chu/QD+uAZS5oTz+ttLonwcq8XQGNXZ4eenRW7dmoJKjwzqOMo55uhtcVB+fAYiT/vET
         zoCxZUEHgKsVhe2E0+tiA3kMarYLvmt7JddO5Dmxv0Rb1ZBiiWv/yIR35zphv6WZbSqG
         HvacQg4wjSBNhB4g5U08O0jO6M1mLJN6NaYTCKAJISw0HVNOaLifMErDg2HD8+fcKtVN
         RoDw==
X-Gm-Message-State: APjAAAXNmmTeivI2a5gv3az7h+s6F1kUL61Mwv+e7mHfgYkcTkva62SX
        7vMi8QBF1oOatujX41QOQPVZoA/0n+aAqqyGR2Q=
X-Google-Smtp-Source: APXvYqzLSIL88hKc/1DZsmk78o7/GSxZOq5xQ5KEQ4s3VjpkYMsiUxNM8gN26fBeAgPFTpmmgq0K6d8T/9Aee9tCnuU=
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr6600212lfm.170.1570128843620;
 Thu, 03 Oct 2019 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
 <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl> <CANL0fFS7OEzpgCaHqXdYQYitKzrcfBd0B00K0_KASTDSHV=VBw@mail.gmail.com>
In-Reply-To: <CANL0fFS7OEzpgCaHqXdYQYitKzrcfBd0B00K0_KASTDSHV=VBw@mail.gmail.com>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 20:53:49 +0200
Message-ID: <CANL0fFT4hYdp6+XV4q_ZagMB4RWc1sru2JXm6T=XczCNdBfXJw@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     JP <jp@jpvw.nl>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, crope@iki.fi,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I also tried to add a msleep(1000) after the si2168 firmware upload;
no difference.

g
