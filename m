Return-Path: <linux-media+bounces-15133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25E93745B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671082842CD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 07:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7A854645;
	Fri, 19 Jul 2024 07:25:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8384E446CF
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721373930; cv=none; b=uxT8WgRKV9PKxarL7OJ+ySs/9E8H4OdKOMlwTyFidKmx9m+Zl8nc51ZfKLhrByLfcXAaEqwYRWipS1RsI8PqSxWb1wPc0atzGLZQau1nV59fBOr40Q3fNxwBjwMuZylEdW++LQElEJBuQkQFTeaI1N0TJAGPqJgzijims0znrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721373930; c=relaxed/simple;
	bh=BjnSTs1Y7CeGKSsIFNvbzFUSYtxo73a+gj4VUCxP4QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ZJgsQHoAFGCbQM+c3SX+RkbqocmWIIfMXTPdNHmoBqR8COMzghiwKU4Hk/lX2HvOW6ekGYAd+O1u8DuaBd9kc/rr8bwXanebdQL9kvJwwuZK/QAjji6rOg3niQ2YB4Cw+HjV4peTLQuCED7YkT6/FOKLSD/0z1oC9t57NOXdrSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3BAC4AF0A;
	Fri, 19 Jul 2024 07:25:28 +0000 (UTC)
Message-ID: <5dd81417-7613-476a-8ef1-41356a060cb6@xs4all.nl>
Date: Fri, 19 Jul 2024 09:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] v4l-utils: clang-tidy: convert to for range loop
To: Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20240703011340.10094-1-rosenp@gmail.com>
Content-Language: en-US, nl
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20240703011340.10094-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rosen,

On 03/07/2024 03:13, Rosen Penev wrote:
> Found with: modernize-loop-convert
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/qv4l2/ctrl-tab.cpp                      |  54 +-
>  utils/qv4l2/general-tab.cpp                   |  37 +-
>  utils/qv4l2/qv4l2.cpp                         |   8 +-
>  utils/qvidcap/capture.cpp                     |  12 +-
>  utils/v4l2-compliance/v4l2-compliance.h       |   4 +-
>  utils/v4l2-compliance/v4l2-test-buffers.cpp   |   5 +-
>  utils/v4l2-compliance/v4l2-test-controls.cpp  |  19 +-
>  utils/v4l2-compliance/v4l2-test-time32-64.cpp |   5 +-
>  utils/v4l2-tracer/retrace-gen.cpp             | 237 ++++----

This source...

>  utils/v4l2-tracer/retrace-helper.cpp          |   4 +-
>  utils/v4l2-tracer/trace-gen.cpp               | 526 +++++++++---------

...and this source are generated sources, generated by v4l2-tracer-gen.pl.

So there is no point in changing those, instead the perl script has to
be edited.

CC-ing Deb, since it might be useful for her to take a quick look at what
would be needed to improve this. Using range loops is certainly preferred.

I have accepted this patch, but minus the changes to retrace-gen.cpp
and trace-gen.cpp.

Regards,

	Hans

>  11 files changed, 462 insertions(+), 449 deletions(-)
> 
> diff --git a/utils/qv4l2/ctrl-tab.cpp b/utils/qv4l2/ctrl-tab.cpp
> index 24c11e08..4ff7b6f2 100644
> --- a/utils/qv4l2/ctrl-tab.cpp
> +++ b/utils/qv4l2/ctrl-tab.cpp
> @@ -105,16 +105,15 @@ void ApplicationWindow::addTabs(int m_winWidth)
>  		m_ctrlMap[qec.id] = qec;
>  	}
>  
> -	for (ClassMap::iterator iter = m_classMap.begin(); iter != m_classMap.end(); ++iter) {
> -		if (iter->second.size() == 0)
> +	for (const auto &c : m_classMap) {
> +		if (c.second.size() == 0)
>  			continue;
> -		which = V4L2_CTRL_ID2WHICH(iter->second[0]);
> +		which = V4L2_CTRL_ID2WHICH(c.second[0]);
>  		id = which | 1;
>  		m_col = m_row = 0;
>  		m_cols = 4;
> -		for (int j = 0; j < m_cols; j++) {
> -			m_maxw[j] = 0;
> -		}
> +		for (auto &w : m_maxw)
> +			w = 0;
>  
>  		const v4l2_query_ext_ctrl &qec = m_ctrlMap[id];
>  		QWidget *t = new QWidget(m_tabs);
> @@ -142,11 +141,11 @@ void ApplicationWindow::addTabs(int m_winWidth)
>  			m_row++;
>  		}
>  		m_tabs->addTab(t, tabName);
> -		for (i = 0; i < iter->second.size(); i++) {
> +		for (i = 0; i < c.second.size(); i++) {
>  			if (i & 1)
> -				id = iter->second[(1+iter->second.size()) / 2 + i / 2];
> +				id = c.second[(1 + c.second.size()) / 2 + i / 2];
>  			else
> -				id = iter->second[i / 2];
> +				id = c.second[i / 2];
>  			addCtrl(grid, m_ctrlMap[id]);
>  		}
>  		grid->addWidget(new QWidget(w), grid->rowCount(), 0, 1, m_cols);
> @@ -157,9 +156,8 @@ void ApplicationWindow::addTabs(int m_winWidth)
>  
>  		int totalw = 0;
>  		int diff = 0;
> -		for (int i = 0; i < m_cols; i++) {
> -			totalw += m_maxw[i] + m_pxw;
> -		}
> +		for (const auto &w : m_maxw)
> +			totalw += w + m_pxw;
>  		if (totalw > m_winWidth)
>  			m_winWidth = totalw;
>  		else {
> @@ -176,12 +174,11 @@ void ApplicationWindow::fixWidth(QGridLayout *grid)
>  	grid->setContentsMargins(m_vMargin, m_hMargin, m_vMargin, m_hMargin);
>  	grid->setColumnStretch(3, 1);
>  	QList<QWidget *> list = grid->parentWidget()->parentWidget()->findChildren<QWidget *>();
> -	QList<QWidget *>::iterator it;
>  
> -	for (it = list.begin(); it != list.end(); ++it)	{
> -		if (((*it)->sizeHint().width()) > m_minWidth) {
> -			m_increment = (int) ceil(((*it)->sizeHint().width() - m_minWidth) / m_pxw);
> -			(*it)->setMinimumWidth(m_minWidth + m_increment * m_pxw); // for stepsize expantion of widgets
> +	for (auto &it : list) {
> +		if ((it->sizeHint().width()) > m_minWidth) {
> +			m_increment = (int)ceil((it->sizeHint().width() - m_minWidth) / m_pxw);
> +			it->setMinimumWidth(m_minWidth + m_increment * m_pxw); // for stepsize expantion of widgets
>  		}
>  	}
>  
> @@ -415,9 +412,7 @@ void ApplicationWindow::ctrlAction(int id)
>  	struct v4l2_ext_controls ctrls;
>  	int idx = 0;
>  
> -	for (unsigned i = 0; i < count; i++) {
> -		unsigned id = m_classMap[which][i];
> -
> +	for (unsigned int id : m_classMap[which]) {
>  		if (m_ctrlMap[id].flags & CTRL_FLAG_DISABLED)
>  			continue;
>  		c[idx].id = id;
> @@ -639,9 +634,8 @@ void ApplicationWindow::updateCtrlRange(unsigned id, __s32 new_val)
>  
>  void ApplicationWindow::subscribeCtrlEvents()
>  {
> -	for (ClassMap::iterator iter = m_classMap.begin(); iter != m_classMap.end(); ++iter) {
> -		for (unsigned i = 0; i < m_classMap[iter->first].size(); i++) {
> -			unsigned id = m_classMap[iter->first][i];
> +	for (auto &iter : m_classMap) {
> +		for (unsigned int id : m_classMap[iter.first]) {
>  			struct v4l2_event_subscription sub;
>  
>  			memset(&sub, 0, sizeof(sub));
> @@ -659,9 +653,9 @@ void ApplicationWindow::refresh(unsigned which)
>  	struct v4l2_ext_control *c = new v4l2_ext_control[count];
>  	struct v4l2_ext_controls ctrls;
>  
> -	for (unsigned i = 0; i < count; i++) {
> -		unsigned id = c[cnt].id = m_classMap[which][i];
> -		
> +	for (unsigned int i : m_classMap[which]) {
> +		unsigned id = c[cnt].id = i;
> +
>  		c[cnt].size = 0;
>  		c[cnt].reserved2[0] = 0;
>  		if (m_ctrlMap[id].type == V4L2_CTRL_TYPE_BUTTON)
> @@ -715,8 +709,8 @@ void ApplicationWindow::refresh(unsigned which)
>  
>  void ApplicationWindow::refresh()
>  {
> -	for (ClassMap::iterator iter = m_classMap.begin(); iter != m_classMap.end(); ++iter)
> -		refresh(iter->first);
> +	for (auto &iter : m_classMap)
> +		refresh(iter.first);
>  }
>  
>  void ApplicationWindow::setWhat(QWidget *w, unsigned id, const QString &v)
> @@ -889,9 +883,7 @@ void ApplicationWindow::setString(unsigned id, const QString &v)
>  
>  void ApplicationWindow::setDefaults(unsigned which)
>  {
> -	for (unsigned i = 0; i < m_classMap[which].size(); i++) {
> -		unsigned id = m_classMap[which][i];
> -
> +	for (unsigned int id : m_classMap[which]) {
>  		if (m_ctrlMap[id].flags & V4L2_CTRL_FLAG_READ_ONLY)
>  			continue;
>  		if (m_ctrlMap[id].flags & V4L2_CTRL_FLAG_GRABBED)
> diff --git a/utils/qv4l2/general-tab.cpp b/utils/qv4l2/general-tab.cpp
> index 7cbefdbf..2fb16577 100644
> --- a/utils/qv4l2/general-tab.cpp
> +++ b/utils/qv4l2/general-tab.cpp
> @@ -917,40 +917,37 @@ void GeneralTab::fixWidth()
>  	setColumnStretch(3, 1);
>  
>  	QList<QWidget *> list = parentWidget()->findChildren<QWidget *>();
> -	QList<QWidget *>::iterator it;
> -	for (it = list.begin(); it != list.end(); ++it)	{
> -		if (!qobject_cast<QComboBox *>(*it) &&
> -		    !qobject_cast<QSpinBox *>(*it) &&
> -		    !qobject_cast<QSlider *>(*it))
> +	for (const auto &child : list) {
> +		if (!qobject_cast<QComboBox *>(child) && !qobject_cast<QSpinBox *>(child) &&
> +		    !qobject_cast<QSlider *>(child))
>  			continue;
>  
> -		if (((*it)->sizeHint().width()) > m_minWidth) {
> -			m_increment = (int) ceil(((*it)->sizeHint().width() - m_minWidth) / m_pxw);
> -			(*it)->setMinimumWidth(m_minWidth + m_increment * m_pxw); // for stepsize expansion of widgets
> +		if ((child->sizeHint().width()) > m_minWidth) {
> +			m_increment = (int)ceil((child->sizeHint().width() - m_minWidth) / m_pxw);
> +			child->setMinimumWidth(m_minWidth + m_increment * m_pxw); // for stepsize expansion of widgets
>  		}
>  	}
>  
>  	// fix width of subgrids
> -	QList<QGridLayout *>::iterator i;
> -	for (i = m_grids.begin(); i != m_grids.end(); ++i) {
> -		(*i)->setColumnStretch(3, 1);
> -		(*i)->setContentsMargins(0, 0, 0, 0);
> -		for (int n = 0; n < (*i)->count(); n++) {
> -			if ((*i)->itemAt(n)->widget()->sizeHint().width() > m_maxw[n % 4]) {
> -				m_maxw[n % 4] = (*i)->itemAt(n)->widget()->sizeHint().width();
> +	for (const auto &grid : m_grids) {
> +		grid->setColumnStretch(3, 1);
> +		grid->setContentsMargins(0, 0, 0, 0);
> +		for (int n = 0; n < grid->count(); n++) {
> +			if (grid->itemAt(n)->widget()->sizeHint().width() > m_maxw[n % 4]) {
> +				m_maxw[n % 4] = grid->itemAt(n)->widget()->sizeHint().width();
>  			}
>  			if (n % 2) {
> -				if (!qobject_cast<QToolButton*>((*i)->itemAt(n)->widget()))
> -					(*i)->itemAt(n)->widget()->setMinimumWidth(m_minWidth);
> +				if (!qobject_cast<QToolButton *>(grid->itemAt(n)->widget()))
> +					grid->itemAt(n)->widget()->setMinimumWidth(m_minWidth);
>  			} else {
> -				(*i)->itemAt(n)->widget()->setMinimumWidth(m_maxw[n % 4]);
> +				grid->itemAt(n)->widget()->setMinimumWidth(m_maxw[n % 4]);
>  			}
>  		}
>  		for (int j = 0; j < m_cols; j++) {
>  			if (j % 2)
> -				(*i)->setColumnMinimumWidth(j,m_maxw[j] + m_pxw);
> +				grid->setColumnMinimumWidth(j, m_maxw[j] + m_pxw);
>  			else
> -				(*i)->setColumnMinimumWidth(j,m_maxw[j]);
> +				grid->setColumnMinimumWidth(j, m_maxw[j]);
>  		}
>  	}
>  
> diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
> index ddb43e38..7bca5785 100644
> --- a/utils/qv4l2/qv4l2.cpp
> +++ b/utils/qv4l2/qv4l2.cpp
> @@ -127,8 +127,8 @@ ApplicationWindow::ApplicationWindow() :
>  	m_tpgYCbCrEnc = 0;
>  	m_tpgQuantRange = 0;
>  	m_tpgLimRGBRange = NULL;
> -	for (unsigned b = 0; b < sizeof(m_clear); b++)
> -		m_clear[b] = false;
> +	for (bool &b : m_clear)
> +		b = false;
>  
>  	QAction *openAct = new QAction(QIcon(":/fileopen.png"), "&Open Device", this);
>  	openAct->setStatusTip("Open a v4l device, use libv4l2 wrapper if possible");
> @@ -1254,8 +1254,8 @@ void ApplicationWindow::updateCropping()
>  void ApplicationWindow::clearBuffers()
>  {
>  	if (m_capture)
> -		for (unsigned b = 0; b < sizeof(m_clear); b++)
> -			m_clear[b] = true;
> +		for (bool &b : m_clear)
> +			b = true;
>  }
>  
>  void ApplicationWindow::startAudio()
> diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
> index 1e3597b0..e3c081c9 100644
> --- a/utils/qvidcap/capture.cpp
> +++ b/utils/qvidcap/capture.cpp
> @@ -194,14 +194,12 @@ enum {
>  
>  static void checkSubMenuItem(QMenu *menu, __u32 value)
>  {
> -	QList<QAction *> actions = menu->actions();
> -	QList<QAction *>::iterator iter;
> -
> -	for (iter = actions.begin(); iter != actions.end(); ++iter)
> -		if ((*iter)->data() == value)
> +	for (auto &action : menu->actions()) {
> +		if (action->data() == value) {
> +			action->setChecked(true);
>  			break;
> -	if (iter != actions.end())
> -		(*iter)->setChecked(true);
> +		}
> +	}
>  }
>  
>  static QAction *addSubMenuItem(QActionGroup *grp, QMenu *menu, const QString &text, int val)
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 3517bd07..948b62fd 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -189,8 +189,8 @@ public:
>  	filehandles() {}
>  	~filehandles()
>  	{
> -		for (std::set<int>::const_iterator iter = fhs.begin(); iter != fhs.end(); ++iter)
> -			close(*iter);
> +		for (int fh : fhs)
> +			close(fh);
>  	}
>  
>  	int add(int fd)
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 3d09b6c7..2ec7d7cf 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -2242,7 +2242,6 @@ int testRequests(struct node *node, bool test_streaming)
>  	filehandles fhs;
>  	int media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
>  	int req_fd;
> -	qctrl_map::iterator iter;
>  	struct test_query_ext_ctrl valid_qctrl;
>  	v4l2_ext_controls ctrls;
>  	v4l2_ext_control ctrl;
> @@ -2302,8 +2301,8 @@ int testRequests(struct node *node, bool test_streaming)
>  	memset(&valid_qctrl, 0, sizeof(valid_qctrl));
>  	memset(&ctrls, 0, sizeof(ctrls));
>  	memset(&ctrl, 0, sizeof(ctrl));
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (auto &control : node->controls) {
> +		test_query_ext_ctrl &qctrl = control.second;
>  
>  		if (qctrl.type != V4L2_CTRL_TYPE_INTEGER &&
>  		    qctrl.type != V4L2_CTRL_TYPE_BOOLEAN)
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index d7f6be43..e29174ec 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -433,13 +433,12 @@ static int checkSimpleCtrl(const struct v4l2_control &ctrl, const struct test_qu
>  
>  int testSimpleControls(struct node *node)
>  {
> -	qctrl_map::iterator iter;
>  	struct v4l2_control ctrl;
>  	int ret;
>  	int i;
>  
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (auto &control : node->controls) {
> +		test_query_ext_ctrl &qctrl = control.second;
>  
>  		if (qctrl.type >= V4L2_CTRL_COMPOUND_TYPES || qctrl.nr_of_dims)
>  			continue;
> @@ -881,8 +880,8 @@ int testExtendedControls(struct node *node)
>  	if (check_0(ctrls.reserved, sizeof(ctrls.reserved)))
>  		return fail("reserved not zeroed\n");
>  
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (auto &control : node->controls) {
> +		test_query_ext_ctrl &qctrl = control.second;
>  
>  		if (is_vivid && V4L2_CTRL_ID2WHICH(qctrl.id) == V4L2_CTRL_CLASS_VIVID)
>  			continue;
> @@ -1003,8 +1002,8 @@ int testExtendedControls(struct node *node)
>  	if (ctrls.error_idx != ctrls.count)
>  		return fail("s_ext_ctrls(0) invalid error_idx %u\n", ctrls.error_idx);
>  
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (auto &control : node->controls) {
> +		test_query_ext_ctrl &qctrl = control.second;
>  		struct v4l2_ext_control ctrl;
>  
>  		if (qctrl.flags & (V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY))
> @@ -1089,10 +1088,8 @@ int testExtendedControls(struct node *node)
>  
>  int testEvents(struct node *node)
>  {
> -	qctrl_map::iterator iter;
> -
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (auto &control : node->controls) {
> +		test_query_ext_ctrl &qctrl = control.second;
>  		struct v4l2_event_subscription sub = { 0 };
>  		struct v4l2_event ev;
>  		struct timeval timeout = { 0, 100 };
> diff --git a/utils/v4l2-compliance/v4l2-test-time32-64.cpp b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
> index e175c055..752045df 100644
> --- a/utils/v4l2-compliance/v4l2-test-time32-64.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
> @@ -123,7 +123,6 @@ int testTime32_64(struct node *node)
>  	struct v4l2_event_time32 ev32;
>  	struct v4l2_event_time64 ev64;
>  	struct v4l2_event ev;
> -	qctrl_map::iterator iter;
>  
>  	if (node->controls.empty())
>  		return 0;
> @@ -131,8 +130,8 @@ int testTime32_64(struct node *node)
>  	fail_on_test(VIDIOC_DQEVENT != VIDIOC_DQEVENT_TIME32 &&
>  		     VIDIOC_DQEVENT != VIDIOC_DQEVENT_TIME64);
>  
> -	for (iter = node->controls.begin(); iter != node->controls.end(); ++iter) {
> -		test_query_ext_ctrl &qctrl = iter->second;
> +	for (const auto &control : node->controls) {
> +		const test_query_ext_ctrl &qctrl = control.second;
>  		if (qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS)
>  			continue;
>  
> diff --git a/utils/v4l2-tracer/retrace-gen.cpp b/utils/v4l2-tracer/retrace-gen.cpp
> index 52323a0b..a28575cb 100644
> --- a/utils/v4l2-tracer/retrace-gen.cpp
> +++ b/utils/v4l2-tracer/retrace-gen.cpp
> @@ -159,10 +159,11 @@ struct v4l2_ctrl_h264_scaling_matrix *retrace_v4l2_ctrl_h264_scaling_matrix_gen(
>  	int count_scaling_list_4x4 = 0;
>  	json_object *scaling_list_4x4_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_h264_scaling_matrix_obj, "scaling_list_4x4", &scaling_list_4x4_obj)) {
> -		for (size_t i = 0; i < 6; i++) {
> -			for (size_t j = 0; j < 16; j++) {
> +		for (auto &i : p->scaling_list_4x4) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_4x4_obj, count_scaling_list_4x4))
> -					p->scaling_list_4x4[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_4x4_obj, count_scaling_list_4x4++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_4x4_obj, count_scaling_list_4x4++));
>  			}
>  		}
>  	}
> @@ -171,10 +172,11 @@ struct v4l2_ctrl_h264_scaling_matrix *retrace_v4l2_ctrl_h264_scaling_matrix_gen(
>  	int count_scaling_list_8x8 = 0;
>  	json_object *scaling_list_8x8_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_h264_scaling_matrix_obj, "scaling_list_8x8", &scaling_list_8x8_obj)) {
> -		for (size_t i = 0; i < 6; i++) {
> -			for (size_t j = 0; j < 64; j++) {
> +		for (auto &i : p->scaling_list_8x8) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_8x8_obj, count_scaling_list_8x8))
> -					p->scaling_list_8x8[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_8x8_obj, count_scaling_list_8x8++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_8x8_obj, count_scaling_list_8x8++));
>  			}
>  		}
>  	}
> @@ -211,10 +213,11 @@ struct v4l2_h264_weight_factors *retrace_v4l2_h264_weight_factors_gen(json_objec
>  	int count_chroma_weight = 0;
>  	json_object *chroma_weight_obj;
>  	if (json_object_object_get_ex(v4l2_h264_weight_factors_obj, "chroma_weight", &chroma_weight_obj)) {
> -		for (size_t i = 0; i < 32; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->chroma_weight) {
> +			for (short &j : i) {
>  				if (json_object_array_get_idx(chroma_weight_obj, count_chroma_weight))
> -					p->chroma_weight[i][j] = (__s16) json_object_get_int(json_object_array_get_idx(chroma_weight_obj, count_chroma_weight++));
> +					j = (__s16)json_object_get_int(
> +						json_object_array_get_idx(chroma_weight_obj, count_chroma_weight++));
>  			}
>  		}
>  	}
> @@ -223,10 +226,11 @@ struct v4l2_h264_weight_factors *retrace_v4l2_h264_weight_factors_gen(json_objec
>  	int count_chroma_offset = 0;
>  	json_object *chroma_offset_obj;
>  	if (json_object_object_get_ex(v4l2_h264_weight_factors_obj, "chroma_offset", &chroma_offset_obj)) {
> -		for (size_t i = 0; i < 32; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->chroma_offset) {
> +			for (short &j : i) {
>  				if (json_object_array_get_idx(chroma_offset_obj, count_chroma_offset))
> -					p->chroma_offset[i][j] = (__s16) json_object_get_int(json_object_array_get_idx(chroma_offset_obj, count_chroma_offset++));
> +					j = (__s16)json_object_get_int(
> +						json_object_array_get_idx(chroma_offset_obj, count_chroma_offset++));
>  			}
>  		}
>  	}
> @@ -660,12 +664,13 @@ struct v4l2_vp8_entropy *retrace_v4l2_vp8_entropy_gen(json_object *ctrl_obj)
>  	int count_coeff_probs = 0;
>  	json_object *coeff_probs_obj;
>  	if (json_object_object_get_ex(v4l2_vp8_entropy_obj, "coeff_probs", &coeff_probs_obj)) {
> -		for (size_t i = 0; i < 4; i++) {
> -			for (size_t j = 0; j < 8; j++) {
> -				for (size_t k = 0; k < 3; k++) {
> -					for (size_t l = 0; l < V4L2_VP8_COEFF_PROB_CNT; l++) {
> +		for (auto &coeff_prob : p->coeff_probs) {
> +			for (auto &j : coeff_prob) {
> +				for (auto &k : j) {
> +					for (unsigned char &l : k) {
>  						if (json_object_array_get_idx(coeff_probs_obj, count_coeff_probs))
> -							p->coeff_probs[i][j][k][l] = (__u8) json_object_get_int(json_object_array_get_idx(coeff_probs_obj, count_coeff_probs++));
> +							l = (__u8)json_object_get_int(json_object_array_get_idx(
> +								coeff_probs_obj, count_coeff_probs++));
>  					}
>  				}
>  			}
> @@ -694,10 +699,11 @@ struct v4l2_vp8_entropy *retrace_v4l2_vp8_entropy_gen(json_object *ctrl_obj)
>  	int count_mv_probs = 0;
>  	json_object *mv_probs_obj;
>  	if (json_object_object_get_ex(v4l2_vp8_entropy_obj, "mv_probs", &mv_probs_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < V4L2_VP8_MV_PROB_CNT; j++) {
> +		for (auto &mv_prob : p->mv_probs) {
> +			for (unsigned char &j : mv_prob) {
>  				if (json_object_array_get_idx(mv_probs_obj, count_mv_probs))
> -					p->mv_probs[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(mv_probs_obj, count_mv_probs++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(mv_probs_obj, count_mv_probs++));
>  			}
>  		}
>  	}
> @@ -920,10 +926,11 @@ struct v4l2_ctrl_mpeg2_picture *retrace_v4l2_ctrl_mpeg2_picture_gen(json_object
>  	int count_f_code = 0;
>  	json_object *f_code_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_mpeg2_picture_obj, "f_code", &f_code_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->f_code) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(f_code_obj, count_f_code))
> -					p->f_code[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(f_code_obj, count_f_code++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(f_code_obj, count_f_code++));
>  			}
>  		}
>  	}
> @@ -1238,10 +1245,11 @@ struct v4l2_hevc_pred_weight_table *retrace_v4l2_hevc_pred_weight_table_gen(json
>  	int count_delta_chroma_weight_l0 = 0;
>  	json_object *delta_chroma_weight_l0_obj;
>  	if (json_object_object_get_ex(v4l2_hevc_pred_weight_table_obj, "delta_chroma_weight_l0", &delta_chroma_weight_l0_obj)) {
> -		for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->delta_chroma_weight_l0) {
> +			for (signed char &j : i) {
>  				if (json_object_array_get_idx(delta_chroma_weight_l0_obj, count_delta_chroma_weight_l0))
> -					p->delta_chroma_weight_l0[i][j] = (__s8) json_object_get_int(json_object_array_get_idx(delta_chroma_weight_l0_obj, count_delta_chroma_weight_l0++));
> +					j = (__s8)json_object_get_int(json_object_array_get_idx(
> +						delta_chroma_weight_l0_obj, count_delta_chroma_weight_l0++));
>  			}
>  		}
>  	}
> @@ -1250,10 +1258,11 @@ struct v4l2_hevc_pred_weight_table *retrace_v4l2_hevc_pred_weight_table_gen(json
>  	int count_chroma_offset_l0 = 0;
>  	json_object *chroma_offset_l0_obj;
>  	if (json_object_object_get_ex(v4l2_hevc_pred_weight_table_obj, "chroma_offset_l0", &chroma_offset_l0_obj)) {
> -		for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->chroma_offset_l0) {
> +			for (signed char &j : i) {
>  				if (json_object_array_get_idx(chroma_offset_l0_obj, count_chroma_offset_l0))
> -					p->chroma_offset_l0[i][j] = (__s8) json_object_get_int(json_object_array_get_idx(chroma_offset_l0_obj, count_chroma_offset_l0++));
> +					j = (__s8)json_object_get_int(json_object_array_get_idx(
> +						chroma_offset_l0_obj, count_chroma_offset_l0++));
>  			}
>  		}
>  	}
> @@ -1280,10 +1289,11 @@ struct v4l2_hevc_pred_weight_table *retrace_v4l2_hevc_pred_weight_table_gen(json
>  	int count_delta_chroma_weight_l1 = 0;
>  	json_object *delta_chroma_weight_l1_obj;
>  	if (json_object_object_get_ex(v4l2_hevc_pred_weight_table_obj, "delta_chroma_weight_l1", &delta_chroma_weight_l1_obj)) {
> -		for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->delta_chroma_weight_l1) {
> +			for (signed char &j : i) {
>  				if (json_object_array_get_idx(delta_chroma_weight_l1_obj, count_delta_chroma_weight_l1))
> -					p->delta_chroma_weight_l1[i][j] = (__s8) json_object_get_int(json_object_array_get_idx(delta_chroma_weight_l1_obj, count_delta_chroma_weight_l1++));
> +					j = (__s8)json_object_get_int(json_object_array_get_idx(
> +						delta_chroma_weight_l1_obj, count_delta_chroma_weight_l1++));
>  			}
>  		}
>  	}
> @@ -1292,10 +1302,11 @@ struct v4l2_hevc_pred_weight_table *retrace_v4l2_hevc_pred_weight_table_gen(json
>  	int count_chroma_offset_l1 = 0;
>  	json_object *chroma_offset_l1_obj;
>  	if (json_object_object_get_ex(v4l2_hevc_pred_weight_table_obj, "chroma_offset_l1", &chroma_offset_l1_obj)) {
> -		for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->chroma_offset_l1) {
> +			for (signed char &j : i) {
>  				if (json_object_array_get_idx(chroma_offset_l1_obj, count_chroma_offset_l1))
> -					p->chroma_offset_l1[i][j] = (__s8) json_object_get_int(json_object_array_get_idx(chroma_offset_l1_obj, count_chroma_offset_l1++));
> +					j = (__s8)json_object_get_int(json_object_array_get_idx(
> +						chroma_offset_l1_obj, count_chroma_offset_l1++));
>  			}
>  		}
>  	}
> @@ -1541,10 +1552,11 @@ struct v4l2_ctrl_hevc_scaling_matrix *retrace_v4l2_ctrl_hevc_scaling_matrix_gen(
>  	int count_scaling_list_4x4 = 0;
>  	json_object *scaling_list_4x4_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_4x4", &scaling_list_4x4_obj)) {
> -		for (size_t i = 0; i < 6; i++) {
> -			for (size_t j = 0; j < 16; j++) {
> +		for (auto &i : p->scaling_list_4x4) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_4x4_obj, count_scaling_list_4x4))
> -					p->scaling_list_4x4[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_4x4_obj, count_scaling_list_4x4++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_4x4_obj, count_scaling_list_4x4++));
>  			}
>  		}
>  	}
> @@ -1553,10 +1565,11 @@ struct v4l2_ctrl_hevc_scaling_matrix *retrace_v4l2_ctrl_hevc_scaling_matrix_gen(
>  	int count_scaling_list_8x8 = 0;
>  	json_object *scaling_list_8x8_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_8x8", &scaling_list_8x8_obj)) {
> -		for (size_t i = 0; i < 6; i++) {
> -			for (size_t j = 0; j < 64; j++) {
> +		for (auto &i : p->scaling_list_8x8) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_8x8_obj, count_scaling_list_8x8))
> -					p->scaling_list_8x8[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_8x8_obj, count_scaling_list_8x8++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_8x8_obj, count_scaling_list_8x8++));
>  			}
>  		}
>  	}
> @@ -1565,10 +1578,11 @@ struct v4l2_ctrl_hevc_scaling_matrix *retrace_v4l2_ctrl_hevc_scaling_matrix_gen(
>  	int count_scaling_list_16x16 = 0;
>  	json_object *scaling_list_16x16_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_16x16", &scaling_list_16x16_obj)) {
> -		for (size_t i = 0; i < 6; i++) {
> -			for (size_t j = 0; j < 64; j++) {
> +		for (auto &i : p->scaling_list_16x16) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_16x16_obj, count_scaling_list_16x16))
> -					p->scaling_list_16x16[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_16x16_obj, count_scaling_list_16x16++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_16x16_obj, count_scaling_list_16x16++));
>  			}
>  		}
>  	}
> @@ -1577,10 +1591,11 @@ struct v4l2_ctrl_hevc_scaling_matrix *retrace_v4l2_ctrl_hevc_scaling_matrix_gen(
>  	int count_scaling_list_32x32 = 0;
>  	json_object *scaling_list_32x32_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_32x32", &scaling_list_32x32_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 64; j++) {
> +		for (auto &i : p->scaling_list_32x32) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(scaling_list_32x32_obj, count_scaling_list_32x32))
> -					p->scaling_list_32x32[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(scaling_list_32x32_obj, count_scaling_list_32x32++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(
> +						scaling_list_32x32_obj, count_scaling_list_32x32++));
>  			}
>  		}
>  	}
> @@ -1745,10 +1760,11 @@ struct v4l2_vp9_segmentation *retrace_v4l2_vp9_segmentation_gen(json_object *ctr
>  	int count_feature_data = 0;
>  	json_object *feature_data_obj;
>  	if (json_object_object_get_ex(v4l2_vp9_segmentation_obj, "feature_data", &feature_data_obj)) {
> -		for (size_t i = 0; i < 8; i++) {
> -			for (size_t j = 0; j < 4; j++) {
> +		for (auto &i : p->feature_data) {
> +			for (short &j : i) {
>  				if (json_object_array_get_idx(feature_data_obj, count_feature_data))
> -					p->feature_data[i][j] = (__s16) json_object_get_int(json_object_array_get_idx(feature_data_obj, count_feature_data++));
> +					j = (__s16)json_object_get_int(
> +						json_object_array_get_idx(feature_data_obj, count_feature_data++));
>  			}
>  		}
>  	}
> @@ -1926,10 +1942,11 @@ struct v4l2_vp9_mv_probs *retrace_v4l2_vp9_mv_probs_gen(json_object *ctrl_obj)
>  	int count_classes = 0;
>  	json_object *classes_obj;
>  	if (json_object_object_get_ex(v4l2_vp9_mv_probs_obj, "classes", &classes_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 10; j++) {
> +		for (auto &classe : p->classes) {
> +			for (unsigned char &j : classe) {
>  				if (json_object_array_get_idx(classes_obj, count_classes))
> -					p->classes[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(classes_obj, count_classes++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(classes_obj, count_classes++));
>  			}
>  		}
>  	}
> @@ -1947,10 +1964,11 @@ struct v4l2_vp9_mv_probs *retrace_v4l2_vp9_mv_probs_gen(json_object *ctrl_obj)
>  	int count_bits = 0;
>  	json_object *bits_obj;
>  	if (json_object_object_get_ex(v4l2_vp9_mv_probs_obj, "bits", &bits_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 10; j++) {
> +		for (auto &bit : p->bits) {
> +			for (unsigned char &j : bit) {
>  				if (json_object_array_get_idx(bits_obj, count_bits))
> -					p->bits[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(bits_obj, count_bits++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(bits_obj, count_bits++));
>  			}
>  		}
>  	}
> @@ -1959,11 +1977,12 @@ struct v4l2_vp9_mv_probs *retrace_v4l2_vp9_mv_probs_gen(json_object *ctrl_obj)
>  	int count_class0_fr = 0;
>  	json_object *class0_fr_obj;
>  	if (json_object_object_get_ex(v4l2_vp9_mv_probs_obj, "class0_fr", &class0_fr_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> -				for (size_t k = 0; k < 3; k++) {
> +		for (auto &i : p->class0_fr) {
> +			for (auto &j : i) {
> +				for (unsigned char &k : j) {
>  					if (json_object_array_get_idx(class0_fr_obj, count_class0_fr))
> -						p->class0_fr[i][j][k] = (__u8) json_object_get_int(json_object_array_get_idx(class0_fr_obj, count_class0_fr++));
> +						k = (__u8)json_object_get_int(
> +							json_object_array_get_idx(class0_fr_obj, count_class0_fr++));
>  				}
>  			}
>  		}
> @@ -1973,10 +1992,10 @@ struct v4l2_vp9_mv_probs *retrace_v4l2_vp9_mv_probs_gen(json_object *ctrl_obj)
>  	int count_fr = 0;
>  	json_object *fr_obj;
>  	if (json_object_object_get_ex(v4l2_vp9_mv_probs_obj, "fr", &fr_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 3; j++) {
> +		for (auto &i : p->fr) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(fr_obj, count_fr))
> -					p->fr[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(fr_obj, count_fr++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(fr_obj, count_fr++));
>  			}
>  		}
>  	}
> @@ -2017,10 +2036,10 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_tx8 = 0;
>  	json_object *tx8_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "tx8", &tx8_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 1; j++) {
> +		for (auto &i : p->tx8) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(tx8_obj, count_tx8))
> -					p->tx8[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(tx8_obj, count_tx8++));
> +					j = (__u8)json_object_get_int(json_object_array_get_idx(tx8_obj, count_tx8++));
>  			}
>  		}
>  	}
> @@ -2029,10 +2048,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_tx16 = 0;
>  	json_object *tx16_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "tx16", &tx16_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->tx16) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(tx16_obj, count_tx16))
> -					p->tx16[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(tx16_obj, count_tx16++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(tx16_obj, count_tx16++));
>  			}
>  		}
>  	}
> @@ -2041,10 +2061,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_tx32 = 0;
>  	json_object *tx32_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "tx32", &tx32_obj)) {
> -		for (size_t i = 0; i < 2; i++) {
> -			for (size_t j = 0; j < 3; j++) {
> +		for (auto &i : p->tx32) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(tx32_obj, count_tx32))
> -					p->tx32[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(tx32_obj, count_tx32++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(tx32_obj, count_tx32++));
>  			}
>  		}
>  	}
> @@ -2053,14 +2074,16 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_coef = 0;
>  	json_object *coef_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "coef", &coef_obj)) {
> -		for (size_t i = 0; i < 4; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> -				for (size_t k = 0; k < 2; k++) {
> -					for (size_t l = 0; l < 6; l++) {
> -						for (size_t m = 0; m < 6; m++) {
> -							for (size_t n = 0; n < 3; n++) {
> +		for (auto &i : p->coef) {
> +			for (auto &j : i) {
> +				for (auto &k : j) {
> +					for (auto &l : k) {
> +						for (auto &m : l) {
> +							for (unsigned char &n : m) {
>  								if (json_object_array_get_idx(coef_obj, count_coef))
> -									p->coef[i][j][k][l][m][n] = (__u8) json_object_get_int(json_object_array_get_idx(coef_obj, count_coef++));
> +									n = (__u8)json_object_get_int(
> +										json_object_array_get_idx(
> +											coef_obj, count_coef++));
>  							}
>  						}
>  					}
> @@ -2082,10 +2105,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_inter_mode = 0;
>  	json_object *inter_mode_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "inter_mode", &inter_mode_obj)) {
> -		for (size_t i = 0; i < 7; i++) {
> -			for (size_t j = 0; j < 3; j++) {
> +		for (auto &i : p->inter_mode) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(inter_mode_obj, count_inter_mode))
> -					p->inter_mode[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(inter_mode_obj, count_inter_mode++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(inter_mode_obj, count_inter_mode++));
>  			}
>  		}
>  	}
> @@ -2094,10 +2118,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_interp_filter = 0;
>  	json_object *interp_filter_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "interp_filter", &interp_filter_obj)) {
> -		for (size_t i = 0; i < 4; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->interp_filter) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(interp_filter_obj, count_interp_filter))
> -					p->interp_filter[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(interp_filter_obj, count_interp_filter++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(interp_filter_obj, count_interp_filter++));
>  			}
>  		}
>  	}
> @@ -2124,10 +2149,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_single_ref = 0;
>  	json_object *single_ref_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "single_ref", &single_ref_obj)) {
> -		for (size_t i = 0; i < 5; i++) {
> -			for (size_t j = 0; j < 2; j++) {
> +		for (auto &i : p->single_ref) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(single_ref_obj, count_single_ref))
> -					p->single_ref[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(single_ref_obj, count_single_ref++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(single_ref_obj, count_single_ref++));
>  			}
>  		}
>  	}
> @@ -2145,10 +2171,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_y_mode = 0;
>  	json_object *y_mode_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "y_mode", &y_mode_obj)) {
> -		for (size_t i = 0; i < 4; i++) {
> -			for (size_t j = 0; j < 9; j++) {
> +		for (auto &i : p->y_mode) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(y_mode_obj, count_y_mode))
> -					p->y_mode[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(y_mode_obj, count_y_mode++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(y_mode_obj, count_y_mode++));
>  			}
>  		}
>  	}
> @@ -2157,10 +2184,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_uv_mode = 0;
>  	json_object *uv_mode_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "uv_mode", &uv_mode_obj)) {
> -		for (size_t i = 0; i < 10; i++) {
> -			for (size_t j = 0; j < 9; j++) {
> +		for (auto &i : p->uv_mode) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(uv_mode_obj, count_uv_mode))
> -					p->uv_mode[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(uv_mode_obj, count_uv_mode++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(uv_mode_obj, count_uv_mode++));
>  			}
>  		}
>  	}
> @@ -2169,10 +2197,11 @@ struct v4l2_ctrl_vp9_compressed_hdr *retrace_v4l2_ctrl_vp9_compressed_hdr_gen(js
>  	int count_partition = 0;
>  	json_object *partition_obj;
>  	if (json_object_object_get_ex(v4l2_ctrl_vp9_compressed_hdr_obj, "partition", &partition_obj)) {
> -		for (size_t i = 0; i < 16; i++) {
> -			for (size_t j = 0; j < 3; j++) {
> +		for (auto &i : p->partition) {
> +			for (unsigned char &j : i) {
>  				if (json_object_array_get_idx(partition_obj, count_partition))
> -					p->partition[i][j] = (__u8) json_object_get_int(json_object_array_get_idx(partition_obj, count_partition++));
> +					j = (__u8)json_object_get_int(
> +						json_object_array_get_idx(partition_obj, count_partition++));
>  			}
>  		}
>  	}
> @@ -2277,10 +2306,11 @@ struct v4l2_av1_global_motion *retrace_v4l2_av1_global_motion_gen(json_object *c
>  	int count_params = 0;
>  	json_object *params_obj;
>  	if (json_object_object_get_ex(v4l2_av1_global_motion_obj, "params", &params_obj)) {
> -		for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -			for (size_t j = 0; j < 6; j++) {
> +		for (auto &param : p->params) {
> +			for (int &j : param) {
>  				if (json_object_array_get_idx(params_obj, count_params))
> -					p->params[i][j] = (__s32) json_object_get_int(json_object_array_get_idx(params_obj, count_params++));
> +					j = (__s32)json_object_get_int(
> +						json_object_array_get_idx(params_obj, count_params++));
>  			}
>  		}
>  	}
> @@ -2414,10 +2444,11 @@ struct v4l2_av1_segmentation *retrace_v4l2_av1_segmentation_gen(json_object *ctr
>  	int count_feature_data = 0;
>  	json_object *feature_data_obj;
>  	if (json_object_object_get_ex(v4l2_av1_segmentation_obj, "feature_data", &feature_data_obj)) {
> -		for (size_t i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
> -			for (size_t j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++) {
> +		for (auto &i : p->feature_data) {
> +			for (short &j : i) {
>  				if (json_object_array_get_idx(feature_data_obj, count_feature_data))
> -					p->feature_data[i][j] = (__s16) json_object_get_int(json_object_array_get_idx(feature_data_obj, count_feature_data++));
> +					j = (__s16)json_object_get_int(
> +						json_object_array_get_idx(feature_data_obj, count_feature_data++));
>  			}
>  		}
>  	}
> diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
> index db24c667..8efc00f8 100644
> --- a/utils/v4l2-tracer/retrace-helper.cpp
> +++ b/utils/v4l2-tracer/retrace-helper.cpp
> @@ -103,8 +103,8 @@ void print_fds(void)
>  {
>  	if (ctx_retrace.retrace_fds.empty())
>  		fprintf(stderr, "all devices closed\n");
> -	for (auto it = ctx_retrace.retrace_fds.cbegin(); it != ctx_retrace.retrace_fds.cend(); ++it)
> -		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", it->first, it->second);
> +	for (auto retrace_fd : ctx_retrace.retrace_fds)
> +		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", retrace_fd.first, retrace_fd.second);
>  }
>  
>  std::string get_path_retrace_from_path_trace(std::string path_trace, json_object *open_obj)
> diff --git a/utils/v4l2-tracer/trace-gen.cpp b/utils/v4l2-tracer/trace-gen.cpp
> index c1075e77..01306d50 100644
> --- a/utils/v4l2-tracer/trace-gen.cpp
> +++ b/utils/v4l2-tracer/trace-gen.cpp
> @@ -25,8 +25,8 @@ void trace_v4l2_ctrl_h264_sps_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_h264_sps_obj, "num_ref_frames_in_pic_order_cnt_cycle", json_object_new_int(p->num_ref_frames_in_pic_order_cnt_cycle));
>  	/* __s32 offset_for_ref_frame[255] */
>  	json_object *offset_for_ref_frame_obj = json_object_new_array();
> -	for (size_t i = 0; i < 255; i++) {
> -		json_object_array_add(offset_for_ref_frame_obj, json_object_new_int(p->offset_for_ref_frame[i]));
> +	for (int i : p->offset_for_ref_frame) {
> +		json_object_array_add(offset_for_ref_frame_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_h264_sps_obj, "offset_for_ref_frame", offset_for_ref_frame_obj);
>  
> @@ -62,18 +62,18 @@ void trace_v4l2_ctrl_h264_scaling_matrix_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_ctrl_h264_scaling_matrix *p = static_cast<struct v4l2_ctrl_h264_scaling_matrix*>(ptr);
>  	/* __u8 scaling_list_4x4[6][16] */
>  	json_object *scaling_list_4x4_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		for (size_t j = 0; j < 16; j++) {
> -			json_object_array_add(scaling_list_4x4_obj, json_object_new_int(p->scaling_list_4x4[i][j]));
> +	for (auto &i : p->scaling_list_4x4) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_4x4_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_h264_scaling_matrix_obj, "scaling_list_4x4", scaling_list_4x4_obj);
>  
>  	/* __u8 scaling_list_8x8[6][64] */
>  	json_object *scaling_list_8x8_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		for (size_t j = 0; j < 64; j++) {
> -			json_object_array_add(scaling_list_8x8_obj, json_object_new_int(p->scaling_list_8x8[i][j]));
> +	for (auto &i : p->scaling_list_8x8) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_8x8_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_h264_scaling_matrix_obj, "scaling_list_8x8", scaling_list_8x8_obj);
> @@ -87,32 +87,32 @@ void trace_v4l2_h264_weight_factors_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_h264_weight_factors *p = static_cast<struct v4l2_h264_weight_factors*>(ptr);
>  	/* __s16 luma_weight[32] */
>  	json_object *luma_weight_obj = json_object_new_array();
> -	for (size_t i = 0; i < 32; i++) {
> -		json_object_array_add(luma_weight_obj, json_object_new_int(p->luma_weight[i]));
> +	for (short i : p->luma_weight) {
> +		json_object_array_add(luma_weight_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_h264_weight_factors_obj, "luma_weight", luma_weight_obj);
>  
>  	/* __s16 luma_offset[32] */
>  	json_object *luma_offset_obj = json_object_new_array();
> -	for (size_t i = 0; i < 32; i++) {
> -		json_object_array_add(luma_offset_obj, json_object_new_int(p->luma_offset[i]));
> +	for (short i : p->luma_offset) {
> +		json_object_array_add(luma_offset_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_h264_weight_factors_obj, "luma_offset", luma_offset_obj);
>  
>  	/* __s16 chroma_weight[32][2] */
>  	json_object *chroma_weight_obj = json_object_new_array();
> -	for (size_t i = 0; i < 32; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(chroma_weight_obj, json_object_new_int(p->chroma_weight[i][j]));
> +	for (auto &i : p->chroma_weight) {
> +		for (short j : i) {
> +			json_object_array_add(chroma_weight_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_h264_weight_factors_obj, "chroma_weight", chroma_weight_obj);
>  
>  	/* __s16 chroma_offset[32][2] */
>  	json_object *chroma_offset_obj = json_object_new_array();
> -	for (size_t i = 0; i < 32; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(chroma_offset_obj, json_object_new_int(p->chroma_offset[i][j]));
> +	for (auto &i : p->chroma_offset) {
> +		for (short j : i) {
> +			json_object_array_add(chroma_offset_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_h264_weight_factors_obj, "chroma_offset", chroma_offset_obj);
> @@ -128,9 +128,9 @@ void trace_v4l2_ctrl_h264_pred_weights_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_h264_pred_weights_obj, "chroma_log2_weight_denom", json_object_new_int(p->chroma_log2_weight_denom));
>  	/* struct v4l2_h264_weight_factors weight_factors[2] */
>  	json_object *weight_factors_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> +	for (auto &weight_factor : p->weight_factors) {
>  		json_object *element_obj = json_object_new_object();
> -		trace_v4l2_h264_weight_factors_gen(&(p->weight_factors[i]), element_obj);
> +		trace_v4l2_h264_weight_factors_gen(&weight_factor, element_obj);
>  		json_object *element_no_key_obj;
>  		json_object_object_get_ex(element_obj, "v4l2_h264_weight_factors", &element_no_key_obj);
>  		json_object_array_add(weight_factors_obj, element_no_key_obj);
> @@ -168,9 +168,9 @@ void trace_v4l2_ctrl_h264_slice_params_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_h264_slice_params_obj, "num_ref_idx_l1_active_minus1", json_object_new_int(p->num_ref_idx_l1_active_minus1));
>  	/* struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN] */
>  	json_object *ref_pic_list0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_H264_REF_LIST_LEN; i++) {
> +	for (auto &i : p->ref_pic_list0) {
>  		json_object *element_obj = json_object_new_object();
> -		trace_v4l2_h264_reference_gen(&(p->ref_pic_list0[i]), element_obj);
> +		trace_v4l2_h264_reference_gen(&i, element_obj);
>  		json_object *element_no_key_obj;
>  		json_object_object_get_ex(element_obj, "v4l2_h264_reference", &element_no_key_obj);
>  		json_object_array_add(ref_pic_list0_obj, element_no_key_obj);
> @@ -179,9 +179,9 @@ void trace_v4l2_ctrl_h264_slice_params_gen(void *ptr, json_object *parent_obj)
>  
>  	/* struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN] */
>  	json_object *ref_pic_list1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_H264_REF_LIST_LEN; i++) {
> +	for (auto &i : p->ref_pic_list1) {
>  		json_object *element_obj = json_object_new_object();
> -		trace_v4l2_h264_reference_gen(&(p->ref_pic_list1[i]), element_obj);
> +		trace_v4l2_h264_reference_gen(&i, element_obj);
>  		json_object *element_no_key_obj;
>  		json_object_object_get_ex(element_obj, "v4l2_h264_reference", &element_no_key_obj);
>  		json_object_array_add(ref_pic_list1_obj, element_no_key_obj);
> @@ -212,9 +212,9 @@ void trace_v4l2_ctrl_h264_decode_params_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_ctrl_h264_decode_params *p = static_cast<struct v4l2_ctrl_h264_decode_params*>(ptr);
>  	/* struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES] */
>  	json_object *dpb_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +	for (auto &i : p->dpb) {
>  		json_object *element_obj = json_object_new_object();
> -		trace_v4l2_h264_dpb_entry_gen(&(p->dpb[i]), element_obj);
> +		trace_v4l2_h264_dpb_entry_gen(&i, element_obj);
>  		json_object *element_no_key_obj;
>  		json_object_object_get_ex(element_obj, "v4l2_h264_dpb_entry", &element_no_key_obj);
>  		json_object_array_add(dpb_obj, element_no_key_obj);
> @@ -259,22 +259,22 @@ void trace_v4l2_vp8_segment_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp8_segment *p = static_cast<struct v4l2_vp8_segment*>(ptr);
>  	/* __s8 quant_update[4] */
>  	json_object *quant_update_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(quant_update_obj, json_object_new_int(p->quant_update[i]));
> +	for (signed char i : p->quant_update) {
> +		json_object_array_add(quant_update_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp8_segment_obj, "quant_update", quant_update_obj);
>  
>  	/* __s8 lf_update[4] */
>  	json_object *lf_update_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(lf_update_obj, json_object_new_int(p->lf_update[i]));
> +	for (signed char i : p->lf_update) {
> +		json_object_array_add(lf_update_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp8_segment_obj, "lf_update", lf_update_obj);
>  
>  	/* __u8 segment_probs[3] */
>  	json_object *segment_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(segment_probs_obj, json_object_new_int(p->segment_probs[i]));
> +	for (unsigned char segment_prob : p->segment_probs) {
> +		json_object_array_add(segment_probs_obj, json_object_new_int(segment_prob));
>  	}
>  	json_object_object_add(v4l2_vp8_segment_obj, "segment_probs", segment_probs_obj);
>  
> @@ -289,15 +289,15 @@ void trace_v4l2_vp8_loop_filter_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp8_loop_filter *p = static_cast<struct v4l2_vp8_loop_filter*>(ptr);
>  	/* __s8 ref_frm_delta[4] */
>  	json_object *ref_frm_delta_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(ref_frm_delta_obj, json_object_new_int(p->ref_frm_delta[i]));
> +	for (signed char i : p->ref_frm_delta) {
> +		json_object_array_add(ref_frm_delta_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp8_loop_filter_obj, "ref_frm_delta", ref_frm_delta_obj);
>  
>  	/* __s8 mb_mode_delta[4] */
>  	json_object *mb_mode_delta_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(mb_mode_delta_obj, json_object_new_int(p->mb_mode_delta[i]));
> +	for (signed char i : p->mb_mode_delta) {
> +		json_object_array_add(mb_mode_delta_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp8_loop_filter_obj, "mb_mode_delta", mb_mode_delta_obj);
>  
> @@ -328,11 +328,11 @@ void trace_v4l2_vp8_entropy_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp8_entropy *p = static_cast<struct v4l2_vp8_entropy*>(ptr);
>  	/* __u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT] */
>  	json_object *coeff_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		for (size_t j = 0; j < 8; j++) {
> -			for (size_t k = 0; k < 3; k++) {
> -				for (size_t l = 0; l < V4L2_VP8_COEFF_PROB_CNT; l++) {
> -					json_object_array_add(coeff_probs_obj, json_object_new_int(p->coeff_probs[i][j][k][l]));
> +	for (auto &coeff_prob : p->coeff_probs) {
> +		for (auto &j : coeff_prob) {
> +			for (auto &k : j) {
> +				for (unsigned char l : k) {
> +					json_object_array_add(coeff_probs_obj, json_object_new_int(l));
>  				}
>  			}
>  		}
> @@ -341,31 +341,31 @@ void trace_v4l2_vp8_entropy_gen(void *ptr, json_object *parent_obj)
>  
>  	/* __u8 y_mode_probs[4] */
>  	json_object *y_mode_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(y_mode_probs_obj, json_object_new_int(p->y_mode_probs[i]));
> +	for (unsigned char y_mode_prob : p->y_mode_probs) {
> +		json_object_array_add(y_mode_probs_obj, json_object_new_int(y_mode_prob));
>  	}
>  	json_object_object_add(v4l2_vp8_entropy_obj, "y_mode_probs", y_mode_probs_obj);
>  
>  	/* __u8 uv_mode_probs[3] */
>  	json_object *uv_mode_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(uv_mode_probs_obj, json_object_new_int(p->uv_mode_probs[i]));
> +	for (unsigned char uv_mode_prob : p->uv_mode_probs) {
> +		json_object_array_add(uv_mode_probs_obj, json_object_new_int(uv_mode_prob));
>  	}
>  	json_object_object_add(v4l2_vp8_entropy_obj, "uv_mode_probs", uv_mode_probs_obj);
>  
>  	/* __u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT] */
>  	json_object *mv_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < V4L2_VP8_MV_PROB_CNT; j++) {
> -			json_object_array_add(mv_probs_obj, json_object_new_int(p->mv_probs[i][j]));
> +	for (auto &mv_prob : p->mv_probs) {
> +		for (unsigned char j : mv_prob) {
> +			json_object_array_add(mv_probs_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_vp8_entropy_obj, "mv_probs", mv_probs_obj);
>  
>  	/* __u8 padding[3] */
>  	json_object *padding_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(padding_obj, json_object_new_int(p->padding[i]));
> +	for (unsigned char i : p->padding) {
> +		json_object_array_add(padding_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp8_entropy_obj, "padding", padding_obj);
>  
> @@ -411,8 +411,8 @@ void trace_v4l2_ctrl_vp8_frame_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_vp8_frame_obj, "first_part_header_bits", json_object_new_int64(p->first_part_header_bits));
>  	/* __u32 dct_part_sizes[8] */
>  	json_object *dct_part_sizes_obj = json_object_new_array();
> -	for (size_t i = 0; i < 8; i++) {
> -		json_object_array_add(dct_part_sizes_obj, json_object_new_int64(p->dct_part_sizes[i]));
> +	for (unsigned int dct_part_size : p->dct_part_sizes) {
> +		json_object_array_add(dct_part_sizes_obj, json_object_new_int64(dct_part_size));
>  	}
>  	json_object_object_add(v4l2_ctrl_vp8_frame_obj, "dct_part_sizes", dct_part_sizes_obj);
>  
> @@ -445,9 +445,9 @@ void trace_v4l2_ctrl_mpeg2_picture_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_mpeg2_picture_obj, "flags", json_object_new_string(fl2s(p->flags, v4l2_mpeg2_pic_flag_def).c_str()));
>  	/* __u8	f_code[2][2] */
>  	json_object *f_code_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(f_code_obj, json_object_new_int(p->f_code[i][j]));
> +	for (auto &i : p->f_code) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(f_code_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_mpeg2_picture_obj, "f_code", f_code_obj);
> @@ -464,29 +464,29 @@ void trace_v4l2_ctrl_mpeg2_quantisation_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_ctrl_mpeg2_quantisation *p = static_cast<struct v4l2_ctrl_mpeg2_quantisation*>(ptr);
>  	/* __u8	intra_quantiser_matrix[64] */
>  	json_object *intra_quantiser_matrix_obj = json_object_new_array();
> -	for (size_t i = 0; i < 64; i++) {
> -		json_object_array_add(intra_quantiser_matrix_obj, json_object_new_int(p->intra_quantiser_matrix[i]));
> +	for (unsigned char i : p->intra_quantiser_matrix) {
> +		json_object_array_add(intra_quantiser_matrix_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_mpeg2_quantisation_obj, "intra_quantiser_matrix", intra_quantiser_matrix_obj);
>  
>  	/* __u8	non_intra_quantiser_matrix[64] */
>  	json_object *non_intra_quantiser_matrix_obj = json_object_new_array();
> -	for (size_t i = 0; i < 64; i++) {
> -		json_object_array_add(non_intra_quantiser_matrix_obj, json_object_new_int(p->non_intra_quantiser_matrix[i]));
> +	for (unsigned char i : p->non_intra_quantiser_matrix) {
> +		json_object_array_add(non_intra_quantiser_matrix_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_mpeg2_quantisation_obj, "non_intra_quantiser_matrix", non_intra_quantiser_matrix_obj);
>  
>  	/* __u8	chroma_intra_quantiser_matrix[64] */
>  	json_object *chroma_intra_quantiser_matrix_obj = json_object_new_array();
> -	for (size_t i = 0; i < 64; i++) {
> -		json_object_array_add(chroma_intra_quantiser_matrix_obj, json_object_new_int(p->chroma_intra_quantiser_matrix[i]));
> +	for (unsigned char i : p->chroma_intra_quantiser_matrix) {
> +		json_object_array_add(chroma_intra_quantiser_matrix_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_mpeg2_quantisation_obj, "chroma_intra_quantiser_matrix", chroma_intra_quantiser_matrix_obj);
>  
>  	/* __u8	chroma_non_intra_quantiser_matrix[64] */
>  	json_object *chroma_non_intra_quantiser_matrix_obj = json_object_new_array();
> -	for (size_t i = 0; i < 64; i++) {
> -		json_object_array_add(chroma_non_intra_quantiser_matrix_obj, json_object_new_int(p->chroma_non_intra_quantiser_matrix[i]));
> +	for (unsigned char i : p->chroma_non_intra_quantiser_matrix) {
> +		json_object_array_add(chroma_non_intra_quantiser_matrix_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_mpeg2_quantisation_obj, "chroma_non_intra_quantiser_matrix", chroma_non_intra_quantiser_matrix_obj);
>  
> @@ -541,15 +541,15 @@ void trace_v4l2_ctrl_hevc_pps_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_hevc_pps_obj, "num_tile_rows_minus1", json_object_new_int(p->num_tile_rows_minus1));
>  	/* __u8	column_width_minus1[20] */
>  	json_object *column_width_minus1_obj = json_object_new_array();
> -	for (size_t i = 0; i < 20; i++) {
> -		json_object_array_add(column_width_minus1_obj, json_object_new_int(p->column_width_minus1[i]));
> +	for (unsigned char i : p->column_width_minus1) {
> +		json_object_array_add(column_width_minus1_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_pps_obj, "column_width_minus1", column_width_minus1_obj);
>  
>  	/* __u8	row_height_minus1[22] */
>  	json_object *row_height_minus1_obj = json_object_new_array();
> -	for (size_t i = 0; i < 22; i++) {
> -		json_object_array_add(row_height_minus1_obj, json_object_new_int(p->row_height_minus1[i]));
> +	for (unsigned char i : p->row_height_minus1) {
> +		json_object_array_add(row_height_minus1_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_pps_obj, "row_height_minus1", row_height_minus1_obj);
>  
> @@ -577,64 +577,64 @@ void trace_v4l2_hevc_pred_weight_table_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_hevc_pred_weight_table *p = static_cast<struct v4l2_hevc_pred_weight_table*>(ptr);
>  	/* __s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *delta_luma_weight_l0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(delta_luma_weight_l0_obj, json_object_new_int(p->delta_luma_weight_l0[i]));
> +	for (signed char i : p->delta_luma_weight_l0) {
> +		json_object_array_add(delta_luma_weight_l0_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "delta_luma_weight_l0", delta_luma_weight_l0_obj);
>  
>  	/* __s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *luma_offset_l0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(luma_offset_l0_obj, json_object_new_int(p->luma_offset_l0[i]));
> +	for (signed char i : p->luma_offset_l0) {
> +		json_object_array_add(luma_offset_l0_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "luma_offset_l0", luma_offset_l0_obj);
>  
>  	/* __s8	delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2] */
>  	json_object *delta_chroma_weight_l0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(delta_chroma_weight_l0_obj, json_object_new_int(p->delta_chroma_weight_l0[i][j]));
> +	for (auto &i : p->delta_chroma_weight_l0) {
> +		for (signed char j : i) {
> +			json_object_array_add(delta_chroma_weight_l0_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "delta_chroma_weight_l0", delta_chroma_weight_l0_obj);
>  
>  	/* __s8	chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2] */
>  	json_object *chroma_offset_l0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(chroma_offset_l0_obj, json_object_new_int(p->chroma_offset_l0[i][j]));
> +	for (auto &i : p->chroma_offset_l0) {
> +		for (signed char j : i) {
> +			json_object_array_add(chroma_offset_l0_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "chroma_offset_l0", chroma_offset_l0_obj);
>  
>  	/* __s8	delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *delta_luma_weight_l1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(delta_luma_weight_l1_obj, json_object_new_int(p->delta_luma_weight_l1[i]));
> +	for (signed char i : p->delta_luma_weight_l1) {
> +		json_object_array_add(delta_luma_weight_l1_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "delta_luma_weight_l1", delta_luma_weight_l1_obj);
>  
>  	/* __s8	luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *luma_offset_l1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(luma_offset_l1_obj, json_object_new_int(p->luma_offset_l1[i]));
> +	for (signed char i : p->luma_offset_l1) {
> +		json_object_array_add(luma_offset_l1_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "luma_offset_l1", luma_offset_l1_obj);
>  
>  	/* __s8	delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2] */
>  	json_object *delta_chroma_weight_l1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(delta_chroma_weight_l1_obj, json_object_new_int(p->delta_chroma_weight_l1[i][j]));
> +	for (auto &i : p->delta_chroma_weight_l1) {
> +		for (signed char j : i) {
> +			json_object_array_add(delta_chroma_weight_l1_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "delta_chroma_weight_l1", delta_chroma_weight_l1_obj);
>  
>  	/* __s8	chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2] */
>  	json_object *chroma_offset_l1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(chroma_offset_l1_obj, json_object_new_int(p->chroma_offset_l1[i][j]));
> +	for (auto &i : p->chroma_offset_l1) {
> +		for (signed char j : i) {
> +			json_object_array_add(chroma_offset_l1_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_hevc_pred_weight_table_obj, "chroma_offset_l1", chroma_offset_l1_obj);
> @@ -672,15 +672,15 @@ void trace_v4l2_ctrl_hevc_slice_params_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_hevc_slice_params_obj, "slice_segment_addr", json_object_new_int64(p->slice_segment_addr));
>  	/* __u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *ref_idx_l0_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(ref_idx_l0_obj, json_object_new_int(p->ref_idx_l0[i]));
> +	for (unsigned char i : p->ref_idx_l0) {
> +		json_object_array_add(ref_idx_l0_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_slice_params_obj, "ref_idx_l0", ref_idx_l0_obj);
>  
>  	/* __u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *ref_idx_l1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(ref_idx_l1_obj, json_object_new_int(p->ref_idx_l1[i]));
> +	for (unsigned char i : p->ref_idx_l1) {
> +		json_object_array_add(ref_idx_l1_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_slice_params_obj, "ref_idx_l1", ref_idx_l1_obj);
>  
> @@ -705,31 +705,31 @@ void trace_v4l2_ctrl_hevc_decode_params_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_hevc_decode_params_obj, "num_poc_lt_curr", json_object_new_int(p->num_poc_lt_curr));
>  	/* __u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *poc_st_curr_before_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(poc_st_curr_before_obj, json_object_new_int(p->poc_st_curr_before[i]));
> +	for (unsigned char i : p->poc_st_curr_before) {
> +		json_object_array_add(poc_st_curr_before_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_decode_params_obj, "poc_st_curr_before", poc_st_curr_before_obj);
>  
>  	/* __u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *poc_st_curr_after_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(poc_st_curr_after_obj, json_object_new_int(p->poc_st_curr_after[i]));
> +	for (unsigned char i : p->poc_st_curr_after) {
> +		json_object_array_add(poc_st_curr_after_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_decode_params_obj, "poc_st_curr_after", poc_st_curr_after_obj);
>  
>  	/* __u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *poc_lt_curr_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		json_object_array_add(poc_lt_curr_obj, json_object_new_int(p->poc_lt_curr[i]));
> +	for (unsigned char i : p->poc_lt_curr) {
> +		json_object_array_add(poc_lt_curr_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_decode_params_obj, "poc_lt_curr", poc_lt_curr_obj);
>  
>  	json_object_object_add(v4l2_ctrl_hevc_decode_params_obj, "num_delta_pocs_of_ref_rps_idx", json_object_new_int(p->num_delta_pocs_of_ref_rps_idx));
>  	/* struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] */
>  	json_object *dpb_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +	for (auto &i : p->dpb) {
>  		json_object *element_obj = json_object_new_object();
> -		trace_v4l2_hevc_dpb_entry_gen(&(p->dpb[i]), element_obj);
> +		trace_v4l2_hevc_dpb_entry_gen(&i, element_obj);
>  		json_object *element_no_key_obj;
>  		json_object_object_get_ex(element_obj, "v4l2_hevc_dpb_entry", &element_no_key_obj);
>  		json_object_array_add(dpb_obj, element_no_key_obj);
> @@ -746,51 +746,51 @@ void trace_v4l2_ctrl_hevc_scaling_matrix_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_ctrl_hevc_scaling_matrix *p = static_cast<struct v4l2_ctrl_hevc_scaling_matrix*>(ptr);
>  	/* __u8	scaling_list_4x4[6][16] */
>  	json_object *scaling_list_4x4_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		for (size_t j = 0; j < 16; j++) {
> -			json_object_array_add(scaling_list_4x4_obj, json_object_new_int(p->scaling_list_4x4[i][j]));
> +	for (auto &i : p->scaling_list_4x4) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_4x4_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_4x4", scaling_list_4x4_obj);
>  
>  	/* __u8	scaling_list_8x8[6][64] */
>  	json_object *scaling_list_8x8_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		for (size_t j = 0; j < 64; j++) {
> -			json_object_array_add(scaling_list_8x8_obj, json_object_new_int(p->scaling_list_8x8[i][j]));
> +	for (auto &i : p->scaling_list_8x8) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_8x8_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_8x8", scaling_list_8x8_obj);
>  
>  	/* __u8	scaling_list_16x16[6][64] */
>  	json_object *scaling_list_16x16_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		for (size_t j = 0; j < 64; j++) {
> -			json_object_array_add(scaling_list_16x16_obj, json_object_new_int(p->scaling_list_16x16[i][j]));
> +	for (auto &i : p->scaling_list_16x16) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_16x16_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_16x16", scaling_list_16x16_obj);
>  
>  	/* __u8	scaling_list_32x32[2][64] */
>  	json_object *scaling_list_32x32_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 64; j++) {
> -			json_object_array_add(scaling_list_32x32_obj, json_object_new_int(p->scaling_list_32x32[i][j]));
> +	for (auto &i : p->scaling_list_32x32) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(scaling_list_32x32_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_32x32", scaling_list_32x32_obj);
>  
>  	/* __u8	scaling_list_dc_coef_16x16[6] */
>  	json_object *scaling_list_dc_coef_16x16_obj = json_object_new_array();
> -	for (size_t i = 0; i < 6; i++) {
> -		json_object_array_add(scaling_list_dc_coef_16x16_obj, json_object_new_int(p->scaling_list_dc_coef_16x16[i]));
> +	for (unsigned char i : p->scaling_list_dc_coef_16x16) {
> +		json_object_array_add(scaling_list_dc_coef_16x16_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_dc_coef_16x16", scaling_list_dc_coef_16x16_obj);
>  
>  	/* __u8	scaling_list_dc_coef_32x32[2] */
>  	json_object *scaling_list_dc_coef_32x32_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(scaling_list_dc_coef_32x32_obj, json_object_new_int(p->scaling_list_dc_coef_32x32[i]));
> +	for (unsigned char i : p->scaling_list_dc_coef_32x32) {
> +		json_object_array_add(scaling_list_dc_coef_32x32_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hevc_scaling_matrix_obj, "scaling_list_dc_coef_32x32", scaling_list_dc_coef_32x32_obj);
>  
> @@ -812,15 +812,15 @@ void trace_v4l2_ctrl_hdr10_mastering_display_gen(void *ptr, json_object *parent_
>  	struct v4l2_ctrl_hdr10_mastering_display *p = static_cast<struct v4l2_ctrl_hdr10_mastering_display*>(ptr);
>  	/* __u16 display_primaries_x[3] */
>  	json_object *display_primaries_x_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(display_primaries_x_obj, json_object_new_int(p->display_primaries_x[i]));
> +	for (unsigned short i : p->display_primaries_x) {
> +		json_object_array_add(display_primaries_x_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hdr10_mastering_display_obj, "display_primaries_x", display_primaries_x_obj);
>  
>  	/* __u16 display_primaries_y[3] */
>  	json_object *display_primaries_y_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(display_primaries_y_obj, json_object_new_int(p->display_primaries_y[i]));
> +	for (unsigned short i : p->display_primaries_y) {
> +		json_object_array_add(display_primaries_y_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_hdr10_mastering_display_obj, "display_primaries_y", display_primaries_y_obj);
>  
> @@ -837,15 +837,15 @@ void trace_v4l2_vp9_loop_filter_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp9_loop_filter *p = static_cast<struct v4l2_vp9_loop_filter*>(ptr);
>  	/* __s8 ref_deltas[4] */
>  	json_object *ref_deltas_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(ref_deltas_obj, json_object_new_int(p->ref_deltas[i]));
> +	for (signed char ref_delta : p->ref_deltas) {
> +		json_object_array_add(ref_deltas_obj, json_object_new_int(ref_delta));
>  	}
>  	json_object_object_add(v4l2_vp9_loop_filter_obj, "ref_deltas", ref_deltas_obj);
>  
>  	/* __s8 mode_deltas[2] */
>  	json_object *mode_deltas_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(mode_deltas_obj, json_object_new_int(p->mode_deltas[i]));
> +	for (signed char mode_delta : p->mode_deltas) {
> +		json_object_array_add(mode_deltas_obj, json_object_new_int(mode_delta));
>  	}
>  	json_object_object_add(v4l2_vp9_loop_filter_obj, "mode_deltas", mode_deltas_obj);
>  
> @@ -872,31 +872,31 @@ void trace_v4l2_vp9_segmentation_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp9_segmentation *p = static_cast<struct v4l2_vp9_segmentation*>(ptr);
>  	/* __s16 feature_data[8][4] */
>  	json_object *feature_data_obj = json_object_new_array();
> -	for (size_t i = 0; i < 8; i++) {
> -		for (size_t j = 0; j < 4; j++) {
> -			json_object_array_add(feature_data_obj, json_object_new_int(p->feature_data[i][j]));
> +	for (auto &i : p->feature_data) {
> +		for (short j : i) {
> +			json_object_array_add(feature_data_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_vp9_segmentation_obj, "feature_data", feature_data_obj);
>  
>  	/* __u8 feature_enabled[8] */
>  	json_object *feature_enabled_obj = json_object_new_array();
> -	for (size_t i = 0; i < 8; i++) {
> -		json_object_array_add(feature_enabled_obj, json_object_new_int(p->feature_enabled[i]));
> +	for (unsigned char i : p->feature_enabled) {
> +		json_object_array_add(feature_enabled_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_segmentation_obj, "feature_enabled", feature_enabled_obj);
>  
>  	/* __u8 tree_probs[7] */
>  	json_object *tree_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 7; i++) {
> -		json_object_array_add(tree_probs_obj, json_object_new_int(p->tree_probs[i]));
> +	for (unsigned char tree_prob : p->tree_probs) {
> +		json_object_array_add(tree_probs_obj, json_object_new_int(tree_prob));
>  	}
>  	json_object_object_add(v4l2_vp9_segmentation_obj, "tree_probs", tree_probs_obj);
>  
>  	/* __u8 pred_probs[3] */
>  	json_object *pred_probs_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(pred_probs_obj, json_object_new_int(p->pred_probs[i]));
> +	for (unsigned char pred_prob : p->pred_probs) {
> +		json_object_array_add(pred_probs_obj, json_object_new_int(pred_prob));
>  	}
>  	json_object_object_add(v4l2_vp9_segmentation_obj, "pred_probs", pred_probs_obj);
>  
> @@ -942,49 +942,49 @@ void trace_v4l2_vp9_mv_probs_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_vp9_mv_probs *p = static_cast<struct v4l2_vp9_mv_probs*>(ptr);
>  	/* __u8 joint[3] */
>  	json_object *joint_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(joint_obj, json_object_new_int(p->joint[i]));
> +	for (unsigned char i : p->joint) {
> +		json_object_array_add(joint_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "joint", joint_obj);
>  
>  	/* __u8 sign[2] */
>  	json_object *sign_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(sign_obj, json_object_new_int(p->sign[i]));
> +	for (unsigned char i : p->sign) {
> +		json_object_array_add(sign_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "sign", sign_obj);
>  
>  	/* __u8 classes[2][10] */
>  	json_object *classes_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 10; j++) {
> -			json_object_array_add(classes_obj, json_object_new_int(p->classes[i][j]));
> +	for (auto &classe : p->classes) {
> +		for (unsigned char j : classe) {
> +			json_object_array_add(classes_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "classes", classes_obj);
>  
>  	/* __u8 class0_bit[2] */
>  	json_object *class0_bit_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(class0_bit_obj, json_object_new_int(p->class0_bit[i]));
> +	for (unsigned char i : p->class0_bit) {
> +		json_object_array_add(class0_bit_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "class0_bit", class0_bit_obj);
>  
>  	/* __u8 bits[2][10] */
>  	json_object *bits_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 10; j++) {
> -			json_object_array_add(bits_obj, json_object_new_int(p->bits[i][j]));
> +	for (auto &bit : p->bits) {
> +		for (unsigned char j : bit) {
> +			json_object_array_add(bits_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "bits", bits_obj);
>  
>  	/* __u8 class0_fr[2][2][3] */
>  	json_object *class0_fr_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			for (size_t k = 0; k < 3; k++) {
> -				json_object_array_add(class0_fr_obj, json_object_new_int(p->class0_fr[i][j][k]));
> +	for (auto &i : p->class0_fr) {
> +		for (auto &j : i) {
> +			for (unsigned char k : j) {
> +				json_object_array_add(class0_fr_obj, json_object_new_int(k));
>  			}
>  		}
>  	}
> @@ -992,24 +992,24 @@ void trace_v4l2_vp9_mv_probs_gen(void *ptr, json_object *parent_obj)
>  
>  	/* __u8 fr[2][3] */
>  	json_object *fr_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 3; j++) {
> -			json_object_array_add(fr_obj, json_object_new_int(p->fr[i][j]));
> +	for (auto &i : p->fr) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(fr_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "fr", fr_obj);
>  
>  	/* __u8 class0_hp[2] */
>  	json_object *class0_hp_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(class0_hp_obj, json_object_new_int(p->class0_hp[i]));
> +	for (unsigned char i : p->class0_hp) {
> +		json_object_array_add(class0_hp_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "class0_hp", class0_hp_obj);
>  
>  	/* __u8 hp[2] */
>  	json_object *hp_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(hp_obj, json_object_new_int(p->hp[i]));
> +	for (unsigned char i : p->hp) {
> +		json_object_array_add(hp_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_vp9_mv_probs_obj, "hp", hp_obj);
>  
> @@ -1023,40 +1023,40 @@ void trace_v4l2_ctrl_vp9_compressed_hdr_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "tx_mode", json_object_new_int(p->tx_mode));
>  	/* __u8 tx8[2][1] */
>  	json_object *tx8_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 1; j++) {
> -			json_object_array_add(tx8_obj, json_object_new_int(p->tx8[i][j]));
> +	for (auto &i : p->tx8) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(tx8_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "tx8", tx8_obj);
>  
>  	/* __u8 tx16[2][2] */
>  	json_object *tx16_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(tx16_obj, json_object_new_int(p->tx16[i][j]));
> +	for (auto &i : p->tx16) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(tx16_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "tx16", tx16_obj);
>  
>  	/* __u8 tx32[2][3] */
>  	json_object *tx32_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		for (size_t j = 0; j < 3; j++) {
> -			json_object_array_add(tx32_obj, json_object_new_int(p->tx32[i][j]));
> +	for (auto &i : p->tx32) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(tx32_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "tx32", tx32_obj);
>  
>  	/* __u8 coef[4][2][2][6][6][3] */
>  	json_object *coef_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			for (size_t k = 0; k < 2; k++) {
> -				for (size_t l = 0; l < 6; l++) {
> -					for (size_t m = 0; m < 6; m++) {
> -						for (size_t n = 0; n < 3; n++) {
> -							json_object_array_add(coef_obj, json_object_new_int(p->coef[i][j][k][l][m][n]));
> +	for (auto &i : p->coef) {
> +		for (auto &j : i) {
> +			for (auto &k : j) {
> +				for (auto &l : k) {
> +					for (auto &m : l) {
> +						for (unsigned char n : m) {
> +							json_object_array_add(coef_obj, json_object_new_int(n));
>  						}
>  					}
>  				}
> @@ -1067,82 +1067,82 @@ void trace_v4l2_ctrl_vp9_compressed_hdr_gen(void *ptr, json_object *parent_obj)
>  
>  	/* __u8 skip[3] */
>  	json_object *skip_obj = json_object_new_array();
> -	for (size_t i = 0; i < 3; i++) {
> -		json_object_array_add(skip_obj, json_object_new_int(p->skip[i]));
> +	for (unsigned char i : p->skip) {
> +		json_object_array_add(skip_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "skip", skip_obj);
>  
>  	/* __u8 inter_mode[7][3] */
>  	json_object *inter_mode_obj = json_object_new_array();
> -	for (size_t i = 0; i < 7; i++) {
> -		for (size_t j = 0; j < 3; j++) {
> -			json_object_array_add(inter_mode_obj, json_object_new_int(p->inter_mode[i][j]));
> +	for (auto &i : p->inter_mode) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(inter_mode_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "inter_mode", inter_mode_obj);
>  
>  	/* __u8 interp_filter[4][2] */
>  	json_object *interp_filter_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(interp_filter_obj, json_object_new_int(p->interp_filter[i][j]));
> +	for (auto &i : p->interp_filter) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(interp_filter_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "interp_filter", interp_filter_obj);
>  
>  	/* __u8 is_inter[4] */
>  	json_object *is_inter_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(is_inter_obj, json_object_new_int(p->is_inter[i]));
> +	for (unsigned char i : p->is_inter) {
> +		json_object_array_add(is_inter_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "is_inter", is_inter_obj);
>  
>  	/* __u8 comp_mode[5] */
>  	json_object *comp_mode_obj = json_object_new_array();
> -	for (size_t i = 0; i < 5; i++) {
> -		json_object_array_add(comp_mode_obj, json_object_new_int(p->comp_mode[i]));
> +	for (unsigned char i : p->comp_mode) {
> +		json_object_array_add(comp_mode_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "comp_mode", comp_mode_obj);
>  
>  	/* __u8 single_ref[5][2] */
>  	json_object *single_ref_obj = json_object_new_array();
> -	for (size_t i = 0; i < 5; i++) {
> -		for (size_t j = 0; j < 2; j++) {
> -			json_object_array_add(single_ref_obj, json_object_new_int(p->single_ref[i][j]));
> +	for (auto &i : p->single_ref) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(single_ref_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "single_ref", single_ref_obj);
>  
>  	/* __u8 comp_ref[5] */
>  	json_object *comp_ref_obj = json_object_new_array();
> -	for (size_t i = 0; i < 5; i++) {
> -		json_object_array_add(comp_ref_obj, json_object_new_int(p->comp_ref[i]));
> +	for (unsigned char i : p->comp_ref) {
> +		json_object_array_add(comp_ref_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "comp_ref", comp_ref_obj);
>  
>  	/* __u8 y_mode[4][9] */
>  	json_object *y_mode_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		for (size_t j = 0; j < 9; j++) {
> -			json_object_array_add(y_mode_obj, json_object_new_int(p->y_mode[i][j]));
> +	for (auto &i : p->y_mode) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(y_mode_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "y_mode", y_mode_obj);
>  
>  	/* __u8 uv_mode[10][9] */
>  	json_object *uv_mode_obj = json_object_new_array();
> -	for (size_t i = 0; i < 10; i++) {
> -		for (size_t j = 0; j < 9; j++) {
> -			json_object_array_add(uv_mode_obj, json_object_new_int(p->uv_mode[i][j]));
> +	for (auto &i : p->uv_mode) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(uv_mode_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "uv_mode", uv_mode_obj);
>  
>  	/* __u8 partition[16][3] */
>  	json_object *partition_obj = json_object_new_array();
> -	for (size_t i = 0; i < 16; i++) {
> -		for (size_t j = 0; j < 3; j++) {
> -			json_object_array_add(partition_obj, json_object_new_int(p->partition[i][j]));
> +	for (auto &i : p->partition) {
> +		for (unsigned char j : i) {
> +			json_object_array_add(partition_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_ctrl_vp9_compressed_hdr_obj, "partition", partition_obj);
> @@ -1182,23 +1182,23 @@ void trace_v4l2_av1_global_motion_gen(void *ptr, json_object *parent_obj)
>  	struct v4l2_av1_global_motion *p = static_cast<struct v4l2_av1_global_motion*>(ptr);
>  	/* __u8 flags[V4L2_AV1_TOTAL_REFS_PER_FRAME] */
>  	json_object *flags_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		json_object_array_add(flags_obj, json_object_new_int(p->flags[i]));
> +	for (unsigned char flag : p->flags) {
> +		json_object_array_add(flags_obj, json_object_new_int(flag));
>  	}
>  	json_object_object_add(v4l2_av1_global_motion_obj, "flags", flags_obj);
>  
>  	/* enum v4l2_av1_warp_model type[V4L2_AV1_TOTAL_REFS_PER_FRAME] */
>  	json_object *type_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		json_object_array_add(type_obj, json_object_new_int(p->type[i]));
> +	for (auto &i : p->type) {
> +		json_object_array_add(type_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_global_motion_obj, "type", type_obj);
>  
>  	/* __s32 params[V4L2_AV1_TOTAL_REFS_PER_FRAME][6] */
>  	json_object *params_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		for (size_t j = 0; j < 6; j++) {
> -			json_object_array_add(params_obj, json_object_new_int(p->params[i][j]));
> +	for (auto &param : p->params) {
> +		for (int j : param) {
> +			json_object_array_add(params_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_av1_global_motion_obj, "params", params_obj);
> @@ -1216,15 +1216,15 @@ void trace_v4l2_av1_loop_restoration_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_av1_loop_restoration_obj, "lr_uv_shift", json_object_new_int(p->lr_uv_shift));
>  	/* enum v4l2_av1_frame_restoration_type frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX] */
>  	json_object *frame_restoration_type_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_NUM_PLANES_MAX; i++) {
> -		json_object_array_add(frame_restoration_type_obj, json_object_new_int(p->frame_restoration_type[i]));
> +	for (auto &i : p->frame_restoration_type) {
> +		json_object_array_add(frame_restoration_type_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_loop_restoration_obj, "frame_restoration_type", frame_restoration_type_obj);
>  
>  	/* __u32 loop_restoration_size[V4L2_AV1_MAX_NUM_PLANES] */
>  	json_object *loop_restoration_size_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_PLANES; i++) {
> -		json_object_array_add(loop_restoration_size_obj, json_object_new_int64(p->loop_restoration_size[i]));
> +	for (unsigned int i : p->loop_restoration_size) {
> +		json_object_array_add(loop_restoration_size_obj, json_object_new_int64(i));
>  	}
>  	json_object_object_add(v4l2_av1_loop_restoration_obj, "loop_restoration_size", loop_restoration_size_obj);
>  
> @@ -1239,29 +1239,29 @@ void trace_v4l2_av1_cdef_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_av1_cdef_obj, "bits", json_object_new_int(p->bits));
>  	/* __u8 y_pri_strength[V4L2_AV1_CDEF_MAX] */
>  	json_object *y_pri_strength_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
> -		json_object_array_add(y_pri_strength_obj, json_object_new_int(p->y_pri_strength[i]));
> +	for (unsigned char i : p->y_pri_strength) {
> +		json_object_array_add(y_pri_strength_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_cdef_obj, "y_pri_strength", y_pri_strength_obj);
>  
>  	/* __u8 y_sec_strength[V4L2_AV1_CDEF_MAX] */
>  	json_object *y_sec_strength_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
> -		json_object_array_add(y_sec_strength_obj, json_object_new_int(p->y_sec_strength[i]));
> +	for (unsigned char i : p->y_sec_strength) {
> +		json_object_array_add(y_sec_strength_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_cdef_obj, "y_sec_strength", y_sec_strength_obj);
>  
>  	/* __u8 uv_pri_strength[V4L2_AV1_CDEF_MAX] */
>  	json_object *uv_pri_strength_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
> -		json_object_array_add(uv_pri_strength_obj, json_object_new_int(p->uv_pri_strength[i]));
> +	for (unsigned char i : p->uv_pri_strength) {
> +		json_object_array_add(uv_pri_strength_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_cdef_obj, "uv_pri_strength", uv_pri_strength_obj);
>  
>  	/* __u8 uv_sec_strength[V4L2_AV1_CDEF_MAX] */
>  	json_object *uv_sec_strength_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_CDEF_MAX; i++) {
> -		json_object_array_add(uv_sec_strength_obj, json_object_new_int(p->uv_sec_strength[i]));
> +	for (unsigned char i : p->uv_sec_strength) {
> +		json_object_array_add(uv_sec_strength_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_cdef_obj, "uv_sec_strength", uv_sec_strength_obj);
>  
> @@ -1276,16 +1276,16 @@ void trace_v4l2_av1_segmentation_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_av1_segmentation_obj, "last_active_seg_id", json_object_new_int(p->last_active_seg_id));
>  	/* __u8 feature_enabled[V4L2_AV1_MAX_SEGMENTS] */
>  	json_object *feature_enabled_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
> -		json_object_array_add(feature_enabled_obj, json_object_new_int(p->feature_enabled[i]));
> +	for (unsigned char i : p->feature_enabled) {
> +		json_object_array_add(feature_enabled_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_segmentation_obj, "feature_enabled", feature_enabled_obj);
>  
>  	/* __s16 feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] */
>  	json_object *feature_data_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
> -		for (size_t j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++) {
> -			json_object_array_add(feature_data_obj, json_object_new_int(p->feature_data[i][j]));
> +	for (auto &i : p->feature_data) {
> +		for (short j : i) {
> +			json_object_array_add(feature_data_obj, json_object_new_int(j));
>  		}
>  	}
>  	json_object_object_add(v4l2_av1_segmentation_obj, "feature_data", feature_data_obj);
> @@ -1300,23 +1300,23 @@ void trace_v4l2_av1_loop_filter_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_av1_loop_filter_obj, "flags", json_object_new_string(fl2s(p->flags, v4l2_av1_loop_filter_flag_def).c_str()));
>  	/* __u8 level[4] */
>  	json_object *level_obj = json_object_new_array();
> -	for (size_t i = 0; i < 4; i++) {
> -		json_object_array_add(level_obj, json_object_new_int(p->level[i]));
> +	for (unsigned char i : p->level) {
> +		json_object_array_add(level_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_av1_loop_filter_obj, "level", level_obj);
>  
>  	json_object_object_add(v4l2_av1_loop_filter_obj, "sharpness", json_object_new_int(p->sharpness));
>  	/* __s8 ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME] */
>  	json_object *ref_deltas_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		json_object_array_add(ref_deltas_obj, json_object_new_int(p->ref_deltas[i]));
> +	for (signed char ref_delta : p->ref_deltas) {
> +		json_object_array_add(ref_deltas_obj, json_object_new_int(ref_delta));
>  	}
>  	json_object_object_add(v4l2_av1_loop_filter_obj, "ref_deltas", ref_deltas_obj);
>  
>  	/* __s8 mode_deltas[2] */
>  	json_object *mode_deltas_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(mode_deltas_obj, json_object_new_int(p->mode_deltas[i]));
> +	for (signed char mode_delta : p->mode_deltas) {
> +		json_object_array_add(mode_deltas_obj, json_object_new_int(mode_delta));
>  	}
>  	json_object_object_add(v4l2_av1_loop_filter_obj, "mode_deltas", mode_deltas_obj);
>  
> @@ -1352,29 +1352,29 @@ void trace_v4l2_av1_tile_info_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_av1_tile_info_obj, "tile_rows", json_object_new_int(p->tile_rows));
>  	/* __u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1] */
>  	json_object *mi_col_starts_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_TILE_COLS + 1; i++) {
> -		json_object_array_add(mi_col_starts_obj, json_object_new_int64(p->mi_col_starts[i]));
> +	for (unsigned int mi_col_start : p->mi_col_starts) {
> +		json_object_array_add(mi_col_starts_obj, json_object_new_int64(mi_col_start));
>  	}
>  	json_object_object_add(v4l2_av1_tile_info_obj, "mi_col_starts", mi_col_starts_obj);
>  
>  	/* __u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1] */
>  	json_object *mi_row_starts_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_TILE_ROWS + 1; i++) {
> -		json_object_array_add(mi_row_starts_obj, json_object_new_int64(p->mi_row_starts[i]));
> +	for (unsigned int mi_row_start : p->mi_row_starts) {
> +		json_object_array_add(mi_row_starts_obj, json_object_new_int64(mi_row_start));
>  	}
>  	json_object_object_add(v4l2_av1_tile_info_obj, "mi_row_starts", mi_row_starts_obj);
>  
>  	/* __u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS] */
>  	json_object *width_in_sbs_minus_1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_TILE_COLS; i++) {
> -		json_object_array_add(width_in_sbs_minus_1_obj, json_object_new_int64(p->width_in_sbs_minus_1[i]));
> +	for (unsigned int i : p->width_in_sbs_minus_1) {
> +		json_object_array_add(width_in_sbs_minus_1_obj, json_object_new_int64(i));
>  	}
>  	json_object_object_add(v4l2_av1_tile_info_obj, "width_in_sbs_minus_1", width_in_sbs_minus_1_obj);
>  
>  	/* __u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS] */
>  	json_object *height_in_sbs_minus_1_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_TILE_ROWS; i++) {
> -		json_object_array_add(height_in_sbs_minus_1_obj, json_object_new_int64(p->height_in_sbs_minus_1[i]));
> +	for (unsigned int i : p->height_in_sbs_minus_1) {
> +		json_object_array_add(height_in_sbs_minus_1_obj, json_object_new_int64(i));
>  	}
>  	json_object_object_add(v4l2_av1_tile_info_obj, "height_in_sbs_minus_1", height_in_sbs_minus_1_obj);
>  
> @@ -1399,8 +1399,8 @@ void trace_v4l2_ctrl_av1_frame_gen(void *ptr, json_object *parent_obj)
>  	trace_v4l2_av1_cdef_gen(&p->cdef, v4l2_ctrl_av1_frame_obj);
>  	/* __u8 skip_mode_frame[2] */
>  	json_object *skip_mode_frame_obj = json_object_new_array();
> -	for (size_t i = 0; i < 2; i++) {
> -		json_object_array_add(skip_mode_frame_obj, json_object_new_int(p->skip_mode_frame[i]));
> +	for (unsigned char i : p->skip_mode_frame) {
> +		json_object_array_add(skip_mode_frame_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "skip_mode_frame", skip_mode_frame_obj);
>  
> @@ -1422,29 +1422,29 @@ void trace_v4l2_ctrl_av1_frame_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "current_frame_id", json_object_new_int64(p->current_frame_id));
>  	/* __u32 buffer_removal_time[V4L2_AV1_MAX_OPERATING_POINTS] */
>  	json_object *buffer_removal_time_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_OPERATING_POINTS; i++) {
> -		json_object_array_add(buffer_removal_time_obj, json_object_new_int64(p->buffer_removal_time[i]));
> +	for (unsigned int i : p->buffer_removal_time) {
> +		json_object_array_add(buffer_removal_time_obj, json_object_new_int64(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "buffer_removal_time", buffer_removal_time_obj);
>  
>  	/* __u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME] */
>  	json_object *order_hints_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		json_object_array_add(order_hints_obj, json_object_new_int64(p->order_hints[i]));
> +	for (unsigned int order_hint : p->order_hints) {
> +		json_object_array_add(order_hints_obj, json_object_new_int64(order_hint));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "order_hints", order_hints_obj);
>  
>  	/* __u64 reference_frame_ts[V4L2_AV1_TOTAL_REFS_PER_FRAME] */
>  	json_object *reference_frame_ts_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
> -		json_object_array_add(reference_frame_ts_obj, json_object_new_uint64(p->reference_frame_ts[i]));
> +	for (unsigned long long reference_frame_t : p->reference_frame_ts) {
> +		json_object_array_add(reference_frame_ts_obj, json_object_new_uint64(reference_frame_t));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "reference_frame_ts", reference_frame_ts_obj);
>  
>  	/* __s8 ref_frame_idx[V4L2_AV1_REFS_PER_FRAME] */
>  	json_object *ref_frame_idx_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
> -		json_object_array_add(ref_frame_idx_obj, json_object_new_int(p->ref_frame_idx[i]));
> +	for (signed char i : p->ref_frame_idx) {
> +		json_object_array_add(ref_frame_idx_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_frame_obj, "ref_frame_idx", ref_frame_idx_obj);
>  
> @@ -1463,45 +1463,45 @@ void trace_v4l2_ctrl_av1_film_grain_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "num_y_points", json_object_new_int(p->num_y_points));
>  	/* __u8 point_y_value[V4L2_AV1_MAX_NUM_Y_POINTS] */
>  	json_object *point_y_value_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_Y_POINTS; i++) {
> -		json_object_array_add(point_y_value_obj, json_object_new_int(p->point_y_value[i]));
> +	for (unsigned char i : p->point_y_value) {
> +		json_object_array_add(point_y_value_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_y_value", point_y_value_obj);
>  
>  	/* __u8 point_y_scaling[V4L2_AV1_MAX_NUM_Y_POINTS] */
>  	json_object *point_y_scaling_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_Y_POINTS; i++) {
> -		json_object_array_add(point_y_scaling_obj, json_object_new_int(p->point_y_scaling[i]));
> +	for (unsigned char i : p->point_y_scaling) {
> +		json_object_array_add(point_y_scaling_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_y_scaling", point_y_scaling_obj);
>  
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "num_cb_points", json_object_new_int(p->num_cb_points));
>  	/* __u8 point_cb_value[V4L2_AV1_MAX_NUM_CB_POINTS] */
>  	json_object *point_cb_value_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_CB_POINTS; i++) {
> -		json_object_array_add(point_cb_value_obj, json_object_new_int(p->point_cb_value[i]));
> +	for (unsigned char i : p->point_cb_value) {
> +		json_object_array_add(point_cb_value_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_cb_value", point_cb_value_obj);
>  
>  	/* __u8 point_cb_scaling[V4L2_AV1_MAX_NUM_CB_POINTS] */
>  	json_object *point_cb_scaling_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_CB_POINTS; i++) {
> -		json_object_array_add(point_cb_scaling_obj, json_object_new_int(p->point_cb_scaling[i]));
> +	for (unsigned char i : p->point_cb_scaling) {
> +		json_object_array_add(point_cb_scaling_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_cb_scaling", point_cb_scaling_obj);
>  
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "num_cr_points", json_object_new_int(p->num_cr_points));
>  	/* __u8 point_cr_value[V4L2_AV1_MAX_NUM_CR_POINTS] */
>  	json_object *point_cr_value_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_CR_POINTS; i++) {
> -		json_object_array_add(point_cr_value_obj, json_object_new_int(p->point_cr_value[i]));
> +	for (unsigned char i : p->point_cr_value) {
> +		json_object_array_add(point_cr_value_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_cr_value", point_cr_value_obj);
>  
>  	/* __u8 point_cr_scaling[V4L2_AV1_MAX_NUM_CR_POINTS] */
>  	json_object *point_cr_scaling_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_MAX_NUM_CR_POINTS; i++) {
> -		json_object_array_add(point_cr_scaling_obj, json_object_new_int(p->point_cr_scaling[i]));
> +	for (unsigned char i : p->point_cr_scaling) {
> +		json_object_array_add(point_cr_scaling_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "point_cr_scaling", point_cr_scaling_obj);
>  
> @@ -1509,22 +1509,22 @@ void trace_v4l2_ctrl_av1_film_grain_gen(void *ptr, json_object *parent_obj)
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "ar_coeff_lag", json_object_new_int(p->ar_coeff_lag));
>  	/* __u8 ar_coeffs_y_plus_128[V4L2_AV1_AR_COEFFS_SIZE] */
>  	json_object *ar_coeffs_y_plus_128_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_AR_COEFFS_SIZE; i++) {
> -		json_object_array_add(ar_coeffs_y_plus_128_obj, json_object_new_int(p->ar_coeffs_y_plus_128[i]));
> +	for (unsigned char i : p->ar_coeffs_y_plus_128) {
> +		json_object_array_add(ar_coeffs_y_plus_128_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "ar_coeffs_y_plus_128", ar_coeffs_y_plus_128_obj);
>  
>  	/* __u8 ar_coeffs_cb_plus_128[V4L2_AV1_AR_COEFFS_SIZE] */
>  	json_object *ar_coeffs_cb_plus_128_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_AR_COEFFS_SIZE; i++) {
> -		json_object_array_add(ar_coeffs_cb_plus_128_obj, json_object_new_int(p->ar_coeffs_cb_plus_128[i]));
> +	for (unsigned char i : p->ar_coeffs_cb_plus_128) {
> +		json_object_array_add(ar_coeffs_cb_plus_128_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "ar_coeffs_cb_plus_128", ar_coeffs_cb_plus_128_obj);
>  
>  	/* __u8 ar_coeffs_cr_plus_128[V4L2_AV1_AR_COEFFS_SIZE] */
>  	json_object *ar_coeffs_cr_plus_128_obj = json_object_new_array();
> -	for (size_t i = 0; i < V4L2_AV1_AR_COEFFS_SIZE; i++) {
> -		json_object_array_add(ar_coeffs_cr_plus_128_obj, json_object_new_int(p->ar_coeffs_cr_plus_128[i]));
> +	for (unsigned char i : p->ar_coeffs_cr_plus_128) {
> +		json_object_array_add(ar_coeffs_cr_plus_128_obj, json_object_new_int(i));
>  	}
>  	json_object_object_add(v4l2_ctrl_av1_film_grain_obj, "ar_coeffs_cr_plus_128", ar_coeffs_cr_plus_128_obj);
>  


