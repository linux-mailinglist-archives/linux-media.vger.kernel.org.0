Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A559FBAC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfH1H14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:27:56 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:42715 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfH1H1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:27:55 -0400
Received: by mail-io1-f50.google.com with SMTP id e20so3905692iob.9
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+lZGkxmw+ObIFEN4gnuhkssUQbM4tQhr+1ljGR1tTPo=;
        b=U6NFZlWIxmd3rOooL0aDEOPSOB1yzkVMdSWy791Pj2RjemH+aB2u+wjmfX8BrUUwnb
         IbunahbEjkdosxHcfL4mY7NY/0tWLC6uBSdo/JH4SG9hStvEhhSjcbzferdVyEIiNjIu
         cQdl7dn/t5FMqUithQLPd8ui3tCyrBEFIyQNEfjbM57ZvWMRvnSPq1XFG148rQWPY4qC
         MzpHyB5J37fq6JRkczoK3AbGJ3SlP+CJlzkjueVIZjqqZPEJARbJwphrhD+kjyvPtXdT
         6kbSCWj9ebsx5QFjOOaKAT6SIIlfTUECrdFGbUx112Sj/HzjgV6DU9zVMEujYB4C0EgD
         FLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+lZGkxmw+ObIFEN4gnuhkssUQbM4tQhr+1ljGR1tTPo=;
        b=WJvmWoy9Z1q9VjvcuhhsAh0ox3XxfGlYVhbud9ni+diYohQASL0xrJfYhJMIZNWfZe
         AytxgcBkIijcNczBFHASTK+1fIahurmh96AADbdx5jSPVI1ZeLE3dh/oanam4nQdswkU
         1Po0qNYn3wf3TFcb7Y1DVf8xdHkE4sVq/I84hfQiu70i354Cea467za6g11FnGp5D7DW
         JQ/PYS/SpMNzcvca/VDIwVgWjN9uNfZ7brt+EYsXWfLlZefliMfocVPJ4sbqK7EXAlxr
         2j2L5y+IWsNjNW9z50LOSAqsxJ7B7CL8MDlFIxxvf0HJmux8wenvwTQYqHorwWzZXCxU
         X07w==
X-Gm-Message-State: APjAAAX5+m38G03Bk3p5xtsvQQU8t2qaU368V9L/xb5Oc6US4v6TMcKo
        PYE6fVvGm2jfioKBAH3d/nQ0e/bC+8NINdO0KG5E+A==
X-Google-Smtp-Source: APXvYqxcmekG2vVq5jo+Fa5v1UxzNZlKvXw2SO4uaO3dNLRuP629GUn/m+JB6dT2zHLd7pfD9fda27FzVOZRmTrUH1M=
X-Received: by 2002:a5e:960a:: with SMTP id a10mr2904501ioq.82.1566977274833;
 Wed, 28 Aug 2019 00:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl> <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 28 Aug 2019 09:27:43 +0200
Message-ID: <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
Subject: Re: [PATCHv10 2/2] cec: document CEC_ADAP_G_CONNECTOR_INFO and capability
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

Should this patch also have an explicit From tag?

On Fri, Aug 23, 2019 at 2:21 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Document the new CEC_ADAP_G_CONNECTOR_INFO ioctl and the new
> CEC_CAP_CONNECTOR_INFO capability.
>
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil-cisco@xs4all.nl: added CEC_CAP_CONNECTOR_INFO]
> [hverkuil-cisco@xs4all.nl: added DQEVENT have_conn_info]
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
...
