Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F6176BBC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 16:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfGZOhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 10:37:51 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:34759 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGZOhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 10:37:51 -0400
Received: by mail-lf1-f49.google.com with SMTP id b29so29995052lfq.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mnQpLztatg1KACQNvDQje+tTE0+u0LoN51DBF0jCR/w=;
        b=KHUrURwEZ9R0izq/CMWmZefJCQhtuou+zCkTyFIfg2Jk5AH5x3V5N1If5LENtmCFIQ
         uzubKOBU/cd2iiE6EWgjVD0lyUvFWOkIgTnG5fLsV5Lfjy4z4feaoEDGYEK6IOz20lEz
         fjnVjDVTUeuCCvKbmQ5wqn5nEdLjegmjy0FnH6u9o/sG70h+xrsN6cQC4/neLkhqQxeU
         HyDyXfQoyvnKsBSTmOWFEU5eEiuyPvCgj05DiPzWfMtr3YZUzwgxFm0th/fe+PNaPKyf
         9+vntxTEA7aaLdy9wNyRmgVj2pC5KmwdkN2120KK2U0A3E36QzUCa3Mb3imOljFmRpyN
         vCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mnQpLztatg1KACQNvDQje+tTE0+u0LoN51DBF0jCR/w=;
        b=spzhZmwMnAwmKaPq0mn+a3APk+50OzlAfGbFV7wFQiJ+oTEwqaDUV4qmdEqZ4FnuEl
         ve8IQISmdf9jC79XSUi2JqgD+1NHJ4nx4FmIQPfEJvBEPaS+W5mD4gqKlCeMCRDMtdWw
         IUza+HuCjoqdjsqkcgL3pfjF7gayLC+pDCjWmAFe3Wm5nhymwaK4qpLMMlWnNQtljvaD
         CdZJv4KpL6PbiDDjXMFjDdS03B4O44T++LZs2edaJ8gLMUHmKGlvh8eBoilGyySjpGRH
         lDDC1Rc2LPh3H5VaYh9WTczjAt/szq2AXA+CcwIEE9y0rq7l4aYAs7xJpJUsDGWfqGb+
         eesg==
X-Gm-Message-State: APjAAAVnW0D4WTi4qpN4fBiTWuvxQCkigdtx4j9IiI9GGHzau+qsztF2
        3gy1Q8/2D92pyEvzQLxoeLXkvuGGJs8JMfQQ5O0=
X-Google-Smtp-Source: APXvYqzd5XZ15efet7uDGBNGj0QpdroJ9dUVbMglyJaWVyeo4idoGDppwAhXbCorKOdEkT36Iyj6x3eon1eiqSqlMkI=
X-Received: by 2002:a05:6512:21e:: with SMTP id a30mr24898555lfo.107.1564151868736;
 Fri, 26 Jul 2019 07:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190725095030.GG1263@valkosipuli.retiisi.org.uk>
 <20190725074714.52f775f2@coco.lan> <20190725111727.GH1263@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190725111727.GH1263@valkosipuli.retiisi.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 26 Jul 2019 11:37:51 -0300
Message-ID: <CAOMZO5Co0P9BDHCoX9h7-YeqJCG2VrwayQ8cXmZfJ=BihjpkvQ@mail.gmail.com>
Subject: Re: [GIT PULL for 5.4] V4L2 ISP, fwnode, sensor and CSI2 patches
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jul 25, 2019 at 8:17 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:

> Fabio: could you address the issue?

Yes, I have sent a v2 that addresses the issue.

Regards,

Fabio Estevam
