Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5BC2F4ECB
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 16:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbhAMPbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 10:31:41 -0500
Received: from gofer.mess.org ([88.97.38.141]:34367 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbhAMPbk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 10:31:40 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6D8AEC6378; Wed, 13 Jan 2021 15:30:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610551858; bh=jwl/hg91xZt+1NS9/j77DHAHw6vD/EE1YZJOwXJ1eQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ok7fgTUeQmGcxYKkew6+yF0zkWni4mHP9aWRR0Bd/BIjay4atdbQ7ZvuIZqDEMR9G
         uAGc7GG4W2IHWCFP5WKeeyvbSUBQGtIbf/R8on7Y8MgUoyxAKfce8Dkq2i9M6NF7R/
         mfQOWTRszn1mD+kbOc0Szgo9nKC8RThIaBvYi+cgXUgtJGdyF7M6p6qL+xHSZPuC66
         RLR4vmjEL2O2TgsfDyzAKtvYculZ4KXb0bAtoaDt7Cw7J/a9F8r/8imz8vRUwIBiPd
         Qx/eNxfvsFRjYlCtkE5tZ876BcnlKs8Dr8JPxl6yNJOPfqaH6ABMXFIfBuI5ao7UlP
         BSbE2TRm1OtSQ==
Date:   Wed, 13 Jan 2021 15:30:58 +0000
From:   Sean Young <sean@mess.org>
To:     Luca Boccassi <bluca@debian.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] Build with libbpf, remove local sources
Message-ID: <20210113153058.GB8867@gofer.mess.org>
References: <20210108233608.285497-1-bluca@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108233608.285497-1-bluca@debian.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 08, 2021 at 11:36:08PM +0000, Luca Boccassi wrote:
> libbpf is nowadays widely available in all distros that enable BPF,
> and it is a standalone library with a release cycle and a stable API.
> Remove the old sync of bpf.c/bpf.h and check for the library via
> pkg-config and use it instead.
> Only a minor modification is needed to make it compile.
> 
> Signed-off-by: Luca Boccassi <bluca@debian.org>

Very nice, thank you very much! Yes, it was about time the old pre-libbpf
files were replaced.

> ---
> NOTE: unfortunately I do not have IR capable hardware to use with Linux,
> so I could only build-test this.

I've tested it and it works fine. You would be able to test with rc-loopback,
but never mind.

Patch applied.

Thanks again!

Sean

> 
>  configure.ac               |   3 +-
>  utils/keytable/Makefile.am |   5 +-
>  utils/keytable/bpf.c       | 491 -------------------------------------
>  utils/keytable/bpf.h       | 110 ---------
>  utils/keytable/bpf_load.c  |  15 +-
>  utils/keytable/bpf_load.h  |   2 -
>  utils/keytable/keytable.c  |   2 +-
>  7 files changed, 14 insertions(+), 614 deletions(-)
>  delete mode 100644 utils/keytable/bpf.c
>  delete mode 100644 utils/keytable/bpf.h
> 
> diff --git a/configure.ac b/configure.ac
> index c59d247e..5290fa01 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -556,7 +556,8 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
> -AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang])
> +PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
> +AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
>  
>  # append -static to libtool compile and link command to enforce static libs
>  AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
> diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> index a057eb89..c5eb414a 100644
> --- a/utils/keytable/Makefile.am
> +++ b/utils/keytable/Makefile.am
> @@ -10,14 +10,15 @@ endif
>  ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
>  
>  if WITH_BPF
> -ir_keytable_SOURCES += bpf.c bpf_load.c bpf.h bpf_load.h
> +ir_keytable_SOURCES += bpf_load.c bpf_load.h
>  endif
>  
>  ir_keytable_LDADD = @LIBINTL@
>  ir_keytable_LDFLAGS = $(ARGP_LIBS)
>  
>  if WITH_BPF
> -ir_keytable_LDFLAGS += $(LIBELF_LIBS)
> +ir_keytable_LDFLAGS += $(LIBELF_LIBS) $(LIBBPF_LIBS)
> +ir_keytable_CFLAGS = $(LIBBPF_CFLAGS)
>  SUBDIRS = bpf_protocols
>  endif
>  
> diff --git a/utils/keytable/bpf.c b/utils/keytable/bpf.c
> deleted file mode 100644
> index 69ba190d..00000000
> --- a/utils/keytable/bpf.c
> +++ /dev/null
> @@ -1,491 +0,0 @@
> -// SPDX-License-Identifier: LGPL-2.1
> -
> -/*
> - * common eBPF ELF operations.
> - *
> - * Copyright (C) 2013-2015 Alexei Starovoitov <ast@kernel.org>
> - * Copyright (C) 2015 Wang Nan <wangnan0@huawei.com>
> - * Copyright (C) 2015 Huawei Inc.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation;
> - * version 2.1 of the License (not later!)
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this program; if not,  see <http://www.gnu.org/licenses>
> - */
> -
> -#include <stdlib.h>
> -#include <memory.h>
> -#include <unistd.h>
> -#include <asm/unistd.h>
> -#include <linux/bpf.h>
> -#include "bpf.h"
> -#include <errno.h>
> -
> -/*
> - * When building perf, unistd.h is overridden. __NR_bpf is
> - * required to be defined explicitly.
> - */
> -#ifndef __NR_bpf
> -# if defined(__i386__)
> -#  define __NR_bpf 357
> -# elif defined(__x86_64__)
> -#  define __NR_bpf 321
> -# elif defined(__aarch64__)
> -#  define __NR_bpf 280
> -# elif defined(__sparc__)
> -#  define __NR_bpf 349
> -# elif defined(__s390__)
> -#  define __NR_bpf 351
> -# else
> -#  error __NR_bpf not defined. libbpf does not support your arch.
> -# endif
> -#endif
> -
> -#ifndef min
> -#define min(x, y) ((x) < (y) ? (x) : (y))
> -#endif
> -
> -static inline __u64 ptr_to_u64(const void *ptr)
> -{
> -	return (__u64) (unsigned long) ptr;
> -}
> -
> -static inline int sys_bpf(enum bpf_cmd cmd, union bpf_attr *attr,
> -			  unsigned int size)
> -{
> -	return syscall(__NR_bpf, cmd, attr, size);
> -}
> -
> -int bpf_create_map_xattr(const struct bpf_create_map_attr *create_attr)
> -{
> -	__u32 name_len = create_attr->name ? strlen(create_attr->name) : 0;
> -	union bpf_attr attr = {};
> -
> -	attr.map_type = create_attr->map_type;
> -	attr.key_size = create_attr->key_size;
> -	attr.value_size = create_attr->value_size;
> -	attr.max_entries = create_attr->max_entries;
> -	attr.map_flags = create_attr->map_flags;
> -	memcpy(attr.map_name, create_attr->name,
> -	       min(name_len, BPF_OBJ_NAME_LEN - 1));
> -	attr.numa_node = create_attr->numa_node;
> -	attr.btf_fd = create_attr->btf_fd;
> -	attr.btf_key_type_id = create_attr->btf_key_type_id;
> -	attr.btf_value_type_id = create_attr->btf_value_type_id;
> -	attr.map_ifindex = create_attr->map_ifindex;
> -
> -	return sys_bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
> -}
> -
> -int bpf_create_map_node(enum bpf_map_type map_type, const char *name,
> -			int key_size, int value_size, int max_entries,
> -			__u32 map_flags, int node)
> -{
> -	struct bpf_create_map_attr map_attr = {};
> -
> -	map_attr.name = name;
> -	map_attr.map_type = map_type;
> -	map_attr.map_flags = map_flags;
> -	map_attr.key_size = key_size;
> -	map_attr.value_size = value_size;
> -	map_attr.max_entries = max_entries;
> -	if (node >= 0) {
> -		map_attr.numa_node = node;
> -		map_attr.map_flags |= BPF_F_NUMA_NODE;
> -	}
> -
> -	return bpf_create_map_xattr(&map_attr);
> -}
> -
> -int bpf_create_map(enum bpf_map_type map_type, int key_size,
> -		   int value_size, int max_entries, __u32 map_flags)
> -{
> -	struct bpf_create_map_attr map_attr = {};
> -
> -	map_attr.map_type = map_type;
> -	map_attr.map_flags = map_flags;
> -	map_attr.key_size = key_size;
> -	map_attr.value_size = value_size;
> -	map_attr.max_entries = max_entries;
> -
> -	return bpf_create_map_xattr(&map_attr);
> -}
> -
> -int bpf_create_map_name(enum bpf_map_type map_type, const char *name,
> -			int key_size, int value_size, int max_entries,
> -			__u32 map_flags)
> -{
> -	struct bpf_create_map_attr map_attr = {};
> -
> -	map_attr.name = name;
> -	map_attr.map_type = map_type;
> -	map_attr.map_flags = map_flags;
> -	map_attr.key_size = key_size;
> -	map_attr.value_size = value_size;
> -	map_attr.max_entries = max_entries;
> -
> -	return bpf_create_map_xattr(&map_attr);
> -}
> -
> -int bpf_create_map_in_map_node(enum bpf_map_type map_type, const char *name,
> -			       int key_size, int inner_map_fd, int max_entries,
> -			       __u32 map_flags, int node)
> -{
> -	__u32 name_len = name ? strlen(name) : 0;
> -	union bpf_attr attr = {};
> -
> -	attr.map_type = map_type;
> -	attr.key_size = key_size;
> -	attr.value_size = 4;
> -	attr.inner_map_fd = inner_map_fd;
> -	attr.max_entries = max_entries;
> -	attr.map_flags = map_flags;
> -	memcpy(attr.map_name, name, min(name_len, BPF_OBJ_NAME_LEN - 1));
> -
> -	if (node >= 0) {
> -		attr.map_flags |= BPF_F_NUMA_NODE;
> -		attr.numa_node = node;
> -	}
> -
> -	return sys_bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
> -}
> -
> -int bpf_create_map_in_map(enum bpf_map_type map_type, const char *name,
> -			  int key_size, int inner_map_fd, int max_entries,
> -			  __u32 map_flags)
> -{
> -	return bpf_create_map_in_map_node(map_type, name, key_size,
> -					  inner_map_fd, max_entries, map_flags,
> -					  -1);
> -}
> -
> -int bpf_load_program_xattr(const struct bpf_load_program_attr *load_attr,
> -			   char *log_buf, size_t log_buf_sz)
> -{
> -	union bpf_attr attr;
> -	__u32 name_len;
> -	int fd;
> -
> -	if (!load_attr)
> -		return -EINVAL;
> -
> -	name_len = load_attr->name ? strlen(load_attr->name) : 0;
> -
> -	memset(&attr, 0, sizeof(attr));
> -	attr.prog_type = load_attr->prog_type;
> -	attr.expected_attach_type = load_attr->expected_attach_type;
> -	attr.insn_cnt = (__u32)load_attr->insns_cnt;
> -	attr.insns = ptr_to_u64(load_attr->insns);
> -	attr.license = ptr_to_u64(load_attr->license);
> -	attr.log_buf = ptr_to_u64(NULL);
> -	attr.log_size = 0;
> -	attr.log_level = 0;
> -	attr.kern_version = load_attr->kern_version;
> -	attr.prog_ifindex = load_attr->prog_ifindex;
> -	memcpy(attr.prog_name, load_attr->name,
> -	       min(name_len, BPF_OBJ_NAME_LEN - 1));
> -
> -	fd = sys_bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
> -	if (fd >= 0 || !log_buf || !log_buf_sz)
> -		return fd;
> -
> -	/* Try again with log */
> -	attr.log_buf = ptr_to_u64(log_buf);
> -	attr.log_size = log_buf_sz;
> -	attr.log_level = 1;
> -	log_buf[0] = 0;
> -	return sys_bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
> -}
> -
> -int bpf_load_program(enum bpf_prog_type type, const struct bpf_insn *insns,
> -		     size_t insns_cnt, const char *name, const char *license,
> -		     __u32 kern_version, char *log_buf,
> -		     size_t log_buf_sz)
> -{
> -	struct bpf_load_program_attr load_attr = {};
> -
> -	load_attr.prog_type = type;
> -	load_attr.expected_attach_type = 0;
> -	load_attr.name = name;
> -	load_attr.insns = insns;
> -	load_attr.insns_cnt = insns_cnt;
> -	load_attr.license = license;
> -	load_attr.kern_version = kern_version;
> -
> -	return bpf_load_program_xattr(&load_attr, log_buf, log_buf_sz);
> -}
> -
> -int bpf_verify_program(enum bpf_prog_type type, const struct bpf_insn *insns,
> -		       size_t insns_cnt, int strict_alignment,
> -		       const char *license, __u32 kern_version,
> -		       char *log_buf, size_t log_buf_sz, int log_level)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.prog_type = type;
> -	attr.insn_cnt = (__u32)insns_cnt;
> -	attr.insns = ptr_to_u64(insns);
> -	attr.license = ptr_to_u64(license);
> -	attr.log_buf = ptr_to_u64(log_buf);
> -	attr.log_size = log_buf_sz;
> -	attr.log_level = log_level;
> -	log_buf[0] = 0;
> -	attr.kern_version = kern_version;
> -	attr.prog_flags = strict_alignment ? BPF_F_STRICT_ALIGNMENT : 0;
> -
> -	return sys_bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
> -}
> -
> -int bpf_map_update_elem(int fd, const void *key, const void *value,
> -			__u64 flags)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.map_fd = fd;
> -	attr.key = ptr_to_u64(key);
> -	attr.value = ptr_to_u64(value);
> -	attr.flags = flags;
> -
> -	return sys_bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr));
> -}
> -
> -int bpf_map_lookup_elem(int fd, const void *key, void *value)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.map_fd = fd;
> -	attr.key = ptr_to_u64(key);
> -	attr.value = ptr_to_u64(value);
> -
> -	return sys_bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr));
> -}
> -
> -int bpf_map_delete_elem(int fd, const void *key)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.map_fd = fd;
> -	attr.key = ptr_to_u64(key);
> -
> -	return sys_bpf(BPF_MAP_DELETE_ELEM, &attr, sizeof(attr));
> -}
> -
> -int bpf_map_get_next_key(int fd, const void *key, void *next_key)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.map_fd = fd;
> -	attr.key = ptr_to_u64(key);
> -	attr.next_key = ptr_to_u64(next_key);
> -
> -	return sys_bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeof(attr));
> -}
> -
> -int bpf_obj_pin(int fd, const char *pathname)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.pathname = ptr_to_u64((void *)pathname);
> -	attr.bpf_fd = fd;
> -
> -	return sys_bpf(BPF_OBJ_PIN, &attr, sizeof(attr));
> -}
> -
> -int bpf_obj_get(const char *pathname)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.pathname = ptr_to_u64((void *)pathname);
> -
> -	return sys_bpf(BPF_OBJ_GET, &attr, sizeof(attr));
> -}
> -
> -int bpf_prog_attach(int prog_fd, int target_fd, enum bpf_attach_type type,
> -		    unsigned int flags)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.target_fd	   = target_fd;
> -	attr.attach_bpf_fd = prog_fd;
> -	attr.attach_type   = type;
> -	attr.attach_flags  = flags;
> -
> -	return sys_bpf(BPF_PROG_ATTACH, &attr, sizeof(attr));
> -}
> -
> -int bpf_prog_detach(int target_fd, enum bpf_attach_type type)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.target_fd	 = target_fd;
> -	attr.attach_type = type;
> -
> -	return sys_bpf(BPF_PROG_DETACH, &attr, sizeof(attr));
> -}
> -
> -int bpf_prog_detach2(int prog_fd, int target_fd, enum bpf_attach_type type)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.target_fd	 = target_fd;
> -	attr.attach_bpf_fd = prog_fd;
> -	attr.attach_type = type;
> -
> -	return sys_bpf(BPF_PROG_DETACH, &attr, sizeof(attr));
> -}
> -
> -int bpf_prog_query(int target_fd, enum bpf_attach_type type, __u32 query_flags,
> -		   __u32 *attach_flags, __u32 *prog_ids, __u32 *prog_cnt)
> -{
> -	union bpf_attr attr = {};
> -	int ret;
> -
> -	attr.query.target_fd	= target_fd;
> -	attr.query.attach_type	= type;
> -	attr.query.query_flags	= query_flags;
> -	attr.query.prog_cnt	= *prog_cnt;
> -	attr.query.prog_ids	= ptr_to_u64(prog_ids);
> -
> -	ret = sys_bpf(BPF_PROG_QUERY, &attr, sizeof(attr));
> -	if (attach_flags)
> -		*attach_flags = attr.query.attach_flags;
> -	*prog_cnt = attr.query.prog_cnt;
> -	return ret;
> -}
> -
> -int bpf_prog_test_run(int prog_fd, int repeat, void *data, __u32 size,
> -		      void *data_out, __u32 *size_out, __u32 *retval,
> -		      __u32 *duration)
> -{
> -	union bpf_attr attr = {};
> -	int ret;
> -
> -	attr.test.prog_fd = prog_fd;
> -	attr.test.data_in = ptr_to_u64(data);
> -	attr.test.data_out = ptr_to_u64(data_out);
> -	attr.test.data_size_in = size;
> -	attr.test.repeat = repeat;
> -
> -	ret = sys_bpf(BPF_PROG_TEST_RUN, &attr, sizeof(attr));
> -	if (size_out)
> -		*size_out = attr.test.data_size_out;
> -	if (retval)
> -		*retval = attr.test.retval;
> -	if (duration)
> -		*duration = attr.test.duration;
> -	return ret;
> -}
> -
> -int bpf_prog_get_next_id(__u32 start_id, __u32 *next_id)
> -{
> -	union bpf_attr attr = {};
> -	int err;
> -
> -	attr.start_id = start_id;
> -
> -	err = sys_bpf(BPF_PROG_GET_NEXT_ID, &attr, sizeof(attr));
> -	if (!err)
> -		*next_id = attr.next_id;
> -
> -	return err;
> -}
> -
> -int bpf_map_get_next_id(__u32 start_id, __u32 *next_id)
> -{
> -	union bpf_attr attr = {};
> -	int err;
> -
> -	attr.start_id = start_id;
> -
> -	err = sys_bpf(BPF_MAP_GET_NEXT_ID, &attr, sizeof(attr));
> -	if (!err)
> -		*next_id = attr.next_id;
> -
> -	return err;
> -}
> -
> -int bpf_prog_get_fd_by_id(__u32 id)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.prog_id = id;
> -
> -	return sys_bpf(BPF_PROG_GET_FD_BY_ID, &attr, sizeof(attr));
> -}
> -
> -int bpf_map_get_fd_by_id(__u32 id)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.map_id = id;
> -
> -	return sys_bpf(BPF_MAP_GET_FD_BY_ID, &attr, sizeof(attr));
> -}
> -
> -int bpf_btf_get_fd_by_id(__u32 id)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.btf_id = id;
> -
> -	return sys_bpf(BPF_BTF_GET_FD_BY_ID, &attr, sizeof(attr));
> -}
> -
> -int bpf_obj_get_info_by_fd(int prog_fd, void *info, __u32 *info_len)
> -{
> -	union bpf_attr attr = {};
> -	int err;
> -
> -	attr.info.bpf_fd = prog_fd;
> -	attr.info.info_len = *info_len;
> -	attr.info.info = ptr_to_u64(info);
> -
> -	err = sys_bpf(BPF_OBJ_GET_INFO_BY_FD, &attr, sizeof(attr));
> -	if (!err)
> -		*info_len = attr.info.info_len;
> -
> -	return err;
> -}
> -
> -int bpf_raw_tracepoint_open(const char *name, int prog_fd)
> -{
> -	union bpf_attr attr = {};
> -
> -	attr.raw_tracepoint.name = ptr_to_u64(name);
> -	attr.raw_tracepoint.prog_fd = prog_fd;
> -
> -	return sys_bpf(BPF_RAW_TRACEPOINT_OPEN, &attr, sizeof(attr));
> -}
> -
> -int bpf_load_btf(void *btf, __u32 btf_size, char *log_buf, __u32 log_buf_size,
> -		 bool do_log)
> -{
> -	union bpf_attr attr = {};
> -	int fd;
> -
> -	attr.btf = ptr_to_u64(btf);
> -	attr.btf_size = btf_size;
> -
> -retry:
> -	if (do_log && log_buf && log_buf_size) {
> -		attr.btf_log_level = 1;
> -		attr.btf_log_size = log_buf_size;
> -		attr.btf_log_buf = ptr_to_u64(log_buf);
> -	}
> -
> -	fd = sys_bpf(BPF_BTF_LOAD, &attr, sizeof(attr));
> -	if (fd == -1 && !do_log && log_buf && log_buf_size) {
> -		do_log = true;
> -		goto retry;
> -	}
> -
> -	return fd;
> -}
> diff --git a/utils/keytable/bpf.h b/utils/keytable/bpf.h
> deleted file mode 100644
> index fb3896c9..00000000
> --- a/utils/keytable/bpf.h
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> -
> -/*
> - * common eBPF ELF operations.
> - *
> - * Copyright (C) 2013-2015 Alexei Starovoitov <ast@kernel.org>
> - * Copyright (C) 2015 Wang Nan <wangnan0@huawei.com>
> - * Copyright (C) 2015 Huawei Inc.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation;
> - * version 2.1 of the License (not later!)
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this program; if not,  see <http://www.gnu.org/licenses>
> - */
> -#ifndef __BPF_BPF_H
> -#define __BPF_BPF_H
> -
> -#include <linux/bpf.h>
> -#include <stdbool.h>
> -#include <stddef.h>
> -
> -struct bpf_create_map_attr {
> -	const char *name;
> -	enum bpf_map_type map_type;
> -	__u32 map_flags;
> -	__u32 key_size;
> -	__u32 value_size;
> -	__u32 max_entries;
> -	__u32 numa_node;
> -	__u32 btf_fd;
> -	__u32 btf_key_type_id;
> -	__u32 btf_value_type_id;
> -	__u32 map_ifindex;
> -};
> -
> -int bpf_create_map_xattr(const struct bpf_create_map_attr *create_attr);
> -int bpf_create_map_node(enum bpf_map_type map_type, const char *name,
> -			int key_size, int value_size, int max_entries,
> -			__u32 map_flags, int node);
> -int bpf_create_map_name(enum bpf_map_type map_type, const char *name,
> -			int key_size, int value_size, int max_entries,
> -			__u32 map_flags);
> -int bpf_create_map(enum bpf_map_type map_type, int key_size, int value_size,
> -		   int max_entries, __u32 map_flags);
> -int bpf_create_map_in_map_node(enum bpf_map_type map_type, const char *name,
> -			       int key_size, int inner_map_fd, int max_entries,
> -			       __u32 map_flags, int node);
> -int bpf_create_map_in_map(enum bpf_map_type map_type, const char *name,
> -			  int key_size, int inner_map_fd, int max_entries,
> -			  __u32 map_flags);
> -
> -struct bpf_load_program_attr {
> -	enum bpf_prog_type prog_type;
> -	enum bpf_attach_type expected_attach_type;
> -	const char *name;
> -	const struct bpf_insn *insns;
> -	size_t insns_cnt;
> -	const char *license;
> -	__u32 kern_version;
> -	__u32 prog_ifindex;
> -};
> -
> -/* Recommend log buffer size */
> -#define BPF_LOG_BUF_SIZE (256 * 1024)
> -int bpf_load_program_xattr(const struct bpf_load_program_attr *load_attr,
> -			   char *log_buf, size_t log_buf_sz);
> -int bpf_load_program(enum bpf_prog_type type, const struct bpf_insn *insns,
> -		     size_t insns_cnt, const char *name, const char *license,
> -		     __u32 kern_version, char *log_buf,
> -		     size_t log_buf_sz);
> -int bpf_verify_program(enum bpf_prog_type type, const struct bpf_insn *insns,
> -		       size_t insns_cnt, int strict_alignment,
> -		       const char *license, __u32 kern_version,
> -		       char *log_buf, size_t log_buf_sz, int log_level);
> -
> -int bpf_map_update_elem(int fd, const void *key, const void *value,
> -			__u64 flags);
> -
> -int bpf_map_lookup_elem(int fd, const void *key, void *value);
> -int bpf_map_delete_elem(int fd, const void *key);
> -int bpf_map_get_next_key(int fd, const void *key, void *next_key);
> -int bpf_obj_pin(int fd, const char *pathname);
> -int bpf_obj_get(const char *pathname);
> -int bpf_prog_attach(int prog_fd, int attachable_fd, enum bpf_attach_type type,
> -		    unsigned int flags);
> -int bpf_prog_detach(int attachable_fd, enum bpf_attach_type type);
> -int bpf_prog_detach2(int prog_fd, int attachable_fd, enum bpf_attach_type type);
> -int bpf_prog_test_run(int prog_fd, int repeat, void *data, __u32 size,
> -		      void *data_out, __u32 *size_out, __u32 *retval,
> -		      __u32 *duration);
> -int bpf_prog_get_next_id(__u32 start_id, __u32 *next_id);
> -int bpf_map_get_next_id(__u32 start_id, __u32 *next_id);
> -int bpf_prog_get_fd_by_id(__u32 id);
> -int bpf_map_get_fd_by_id(__u32 id);
> -int bpf_btf_get_fd_by_id(__u32 id);
> -int bpf_obj_get_info_by_fd(int prog_fd, void *info, __u32 *info_len);
> -int bpf_prog_query(int target_fd, enum bpf_attach_type type, __u32 query_flags,
> -		   __u32 *attach_flags, __u32 *prog_ids, __u32 *prog_cnt);
> -int bpf_raw_tracepoint_open(const char *name, int prog_fd);
> -int bpf_load_btf(void *btf, __u32 btf_size, char *log_buf, __u32 log_buf_size,
> -		 bool do_log);
> -#endif
> diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
> index 7ae9af4a..ec6eb98e 100644
> --- a/utils/keytable/bpf_load.c
> +++ b/utils/keytable/bpf_load.c
> @@ -12,10 +12,10 @@
>  #include <limits.h>
>  #include <stdlib.h>
>  #include <linux/bpf.h>
> +#include <bpf/bpf.h>
>  #include <assert.h>
>  #include <argp.h>
>  #include "keymap.h"
> -#include "bpf.h"
>  #include "bpf_load.h"
>  
>  #ifdef ENABLE_NLS
> @@ -28,6 +28,8 @@
>  # define _(string) string
>  #endif
>  
> +#define LOG_BUF_SIZE (256 * 1024)
> +
>  // This should match the struct in the raw BPF decoder
>  struct raw_pattern {
>  	unsigned int scancode;
> @@ -39,7 +41,7 @@ struct raw_pattern {
>  int max_length;
>  int trail_space;
>  
> -char bpf_log_buf[BPF_LOG_BUF_SIZE];
> +char bpf_log_buf[LOG_BUF_SIZE];
>  extern int debug;
>  
>  struct bpf_file {
> @@ -58,14 +60,14 @@ struct bpf_file {
>  	struct protocol_param *param;
>  };
>  
> -static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, const char *name, struct bpf_insn *prog, int size)
> +static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, struct bpf_insn *prog, int size)
>  {
>          size_t insns_cnt = size / sizeof(struct bpf_insn);
>  	int fd, err;
>  
>  	fd = bpf_load_program(BPF_PROG_TYPE_LIRC_MODE2, prog, insns_cnt,
> -			      name, bpf_file->license, 0,
> -			      bpf_log_buf, BPF_LOG_BUF_SIZE);
> +			      bpf_file->license, 0,
> +			      bpf_log_buf, LOG_BUF_SIZE);
>  	if (fd < 0) {
>  		printf("bpf_load_program() err=%m\n%s", bpf_log_buf);
>  		return -1;
> @@ -548,8 +550,7 @@ int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param,
>  		    !(shdr.sh_flags & SHF_EXECINSTR))
>  			continue;
>  
> -		ret = load_and_attach(lirc_fd, &bpf_file, shname, data->d_buf,
> -				      data->d_size);
> +		ret = load_and_attach(lirc_fd, &bpf_file, data->d_buf, data->d_size);
>  		break;
>  	}
>  
> diff --git a/utils/keytable/bpf_load.h b/utils/keytable/bpf_load.h
> index 47b57b25..fe0b3e58 100644
> --- a/utils/keytable/bpf_load.h
> +++ b/utils/keytable/bpf_load.h
> @@ -2,8 +2,6 @@
>  #ifndef __BPF_LOAD_H
>  #define __BPF_LOAD_H
>  
> -#define BPF_LOG_BUF_SIZE (256 * 1024)
> -
>  #define MAX_MAPS 32
>  #define MAX_PROGS 64
>  
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index cb91f1f0..248493a9 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -37,7 +37,7 @@
>  #include "keymap.h"
>  
>  #ifdef HAVE_BPF
> -#include "bpf.h"
> +#include <bpf/bpf.h>
>  #include "bpf_load.h"
>  #endif
>  
> -- 
> 2.29.2
