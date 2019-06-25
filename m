Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C22C2552AB
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730925AbfFYO6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:58:19 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:44083 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730777AbfFYO6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:58:19 -0400
Received: by mail-io1-f42.google.com with SMTP id s7so3839924iob.11
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlZIgR7yHjC3KUzbvkJe7XThmpOgxwcG18TIgT/ItI4=;
        b=G6+Et6YrU9kpO8k/pCFxaas2aaEYAbHqyQ+AdNtRxd03rpKqEf7cOLJRq2wcxTmv/d
         1n1Ee8zRdFFCBWd408Y2UOcQqfjooYgm+AJCxcyNSPLXcjGSD28oIyV7WrnTj0JGF+Fv
         efIcgjeI/go2JKLoLp7B+T6hMCl/By1p9fNcKN335usJxk4DYYreAZLtJsGWBGXIdSg8
         weQZIVVmfVCDyTg3Tlzqjm1F+LiBShdGLgmXgWEdtclL3uiaFvo9sFW2ggCVFuuO1Fim
         6gQNQZTjjJgdZPgcebDxT1R6JhwAyAyZwReLSO0i44be6oUQTOdQU4SeyVei1NA4txF9
         gJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlZIgR7yHjC3KUzbvkJe7XThmpOgxwcG18TIgT/ItI4=;
        b=OoGqQ6OO5A+jQVqrpCuDq6Jz8Nc+1Egg5zkZyUMIRnae2OdbobDVxLJ71bknq71DqO
         VTNH5C+EDl7Be3CqJzoiPf8XsNmQpYAsOBD89cnIy38chmzI+RMKktfLIAwtSHqEcH7J
         GYekQqo1h4dOzmwrC+lm25hBvdUE76PfDTl20LRPbRc4Qi50zHjxO2gBK37MGbDjLv8c
         49s11KQyfRHca2wM4YfmknY5qrdYTknmj4n4CkSyBYfX7octQYHUCaNc+nm2DQsVJFIt
         LDCOeiKKTK3KmrD4pahUib8GdUcBKulLU2YB91fmQT7X08fjYkL6gZDz4Yq/QpFe8PYM
         NNQg==
X-Gm-Message-State: APjAAAWl5mqRy/FO8kHv+MrVUTvKzoeDObevhUAjptqe6MpU/vlDsdFH
        mDvTOOcO12sXSXbHGh7S/+Du+7vmzS17X+M95YLCNex6Gsc=
X-Google-Smtp-Source: APXvYqzcYXFapA9i91+3XG4ii4DKax4nyujj139jZ22IYyQ/I1KtdjJ85nx+BY32dlTJvrLuJ9J4PCDAP68MSg+ek7o=
X-Received: by 2002:a5e:d507:: with SMTP id e7mr8149566iom.284.1561474698620;
 Tue, 25 Jun 2019 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl> <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 25 Jun 2019 16:58:07 +0200
Message-ID: <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
Subject: Re: [PATCHv9 04/13] cec: expose the new connector info API
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again.
On Tue, Jun 25, 2019 at 4:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> +       mutex_lock(&adap->lock);
> +       if (copy_to_user(parg, &adap->conn_info, sizeof(adap->conn_info)))
> +               ret = -EFAULT;
> +       mutex_unlock(&adap->lock);
> +       return ret;
> +}
Shouldn't the lock be released before calling copy_to_user? I guess
you need to make an extra copy of the conn_info, like it is done for
other ioctls.

Regards.
